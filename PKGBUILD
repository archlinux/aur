# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pion
pkgname=$_pkgname-git
pkgver=r284.6da6141
pkgrel=1
pkgdesc='C++ framework for building lightweight HTTP interfaces'
arch=('i686' 'x86_64')
url='https://github.com/splunk/pion'
license=('custom: Boost')
depends=('boost-libs')
makedepends=('git' 'boost')
provides=("$_pkgname" pion-net)
conflicts=("$_pkgname" pion-net)
source=("git+https://github.com/splunk/pion.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr --with-plugins=/usr/lib/pion/plugins --disable-doxygen-doc
  make
}

package() {

  # install software
  cd $_pkgname
  make DESTDIR=$pkgdir install

  # copy license
  install -D -m644 $srcdir/$_pkgname/COPYING \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
