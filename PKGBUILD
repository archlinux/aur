# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=cxxtools-git
pkgver=2.3rc1.r4.ge0ddfff
pkgrel=1
pkgdesc="A collection of general-purpose C++ classes"
arch=('i686' 'x86_64')
url="http://www.tntnet.org/cxxtools.html"
license=('LGPL')
depends=('gcc-libs' 'sh')
makedepends=('git')
provides=('cxxtools')
conflicts=('cxxtools')
source=("$pkgname::git+https://github.com/maekitalo/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^V//' | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"

  autoreconf -i
  ./configure --enable-silent-rules --prefix=/usr
  make
}

check() {
  cd "$pkgname"

  ./test/alltests
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
