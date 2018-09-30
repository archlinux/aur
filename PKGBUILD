# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

_name=inadyn
pkgname=inadyn-fork
pkgver=2.5
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
source=(https://github.com/troglobit/inadyn/releases/download/v$pkgver/$_name-$pkgver.tar.xz)
sha256sums=('4a9ad208671f62912428413da0282450b2d2c4da38f3c95c4ac975d048c41fcd')

build() {
  cd $_name-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  cd $_name-$pkgver
  install -Dm600 examples/inadyn.conf "$pkgdir/etc/inadyn.conf"
  make DESTDIR="$pkgdir" install-strip
}

