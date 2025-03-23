# Maintainer: Felix <felix@salfelder.org>
# Submitter: Felix

_pkgname=qucs
pkgname=$_pkgname-git
pkgver=r3698.9269528
pkgrel=1
pkgdesc="An integrated circuit simulator GUI (develop branch)"
arch=('x86_64' 'i686')
url="http://github.com/qucs/qucs"
license=('GPLv3+')
options=(!makeflags)
depends=('qt5-tools' 'qt5-script' )
makedepends=('git' 'autoconf' 'automake' 'perl-gd' 'perl-xml-libxml' 'libtool')
optdepends=('freehdl: status unknown'
            'qucsator-git: to enable circuit simulation'
            'gnucsator-git: to enable circuit simulation')
source=(git+https://github.com/qucs/qucs#branch=develop)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  make -C $_pkgname DESTDIR="$pkgdir" install
}
