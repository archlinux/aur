# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=tntnet-git
pkgver=2.3rc1.r4.g6c10627
pkgrel=1
pkgdesc="A modular, multithreaded, high performance webapplication server for C++"
arch=('i686' 'x86_64')
url="http://www.tntnet.org/tntnet.html"
license=('LGPL')
depends=('cxxtools-git' 'zlib' 'openssl' 'sh')
makedepends=('git')
optdepends=('base-devel: to build tntnet web applications')
provides=('tntnet')
conflicts=('tntnet')
backup=('etc/tntnet/tntnet.xml')
source=("$pkgname::git+https://github.com/maekitalo/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^V//' | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"

  autoreconf -i
  ./configure --enable-silent-rules --prefix=/usr --sysconfdir=/etc
  make
}

# Currently broken
#check() {
#  cd "$pkgname"
#
#  ./test/tntnet-test
#}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm644 ./etc/tntnet/tntnet.xml "$pkgdir/etc/tntnet/tntnet.xml"
}
