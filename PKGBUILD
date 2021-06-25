# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>

_pkgname=inadyn-fork
pkgname=$_pkgname-git
pkgver=2.8.1.r3.ga78a606
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
makedepends=('git')
provides=('inadyn')
conflicts=('inadyn')
backup=('etc/inadyn.conf')
source=($pkgname::git+https://github.com/troglobit/inadyn.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  cd $pkgname
  install -Dm600 examples/inadyn.conf -t "$pkgdir/etc"
  make DESTDIR="$pkgdir" install-strip
}

