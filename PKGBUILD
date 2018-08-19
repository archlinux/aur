# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

_name=inadyn
pkgname=inadyn-fork
pkgver=2.4
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('i686' 'x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
source=(https://github.com/troglobit/inadyn/releases/download/v$pkgver/$_name-$pkgver.tar.xz)
sha256sums=('f1c2a6a513506444ebf5052982b6b13fa0b280ff737cb56f510488f8dd432727')

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

