# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn-fork
pkgver=2.9.1
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
#source=("https://github.com/troglobit/inadyn/archive/refs/tags/v$pkgver.tar.gz")
source=("https://github.com/troglobit/inadyn/releases/download/v$pkgver/inadyn-$pkgver.tar.xz")
sha256sums=('0094d20cfcd431674b8d658e93169c7589bf8f2b351b2860818a1ca05f0218c5')

build() {
  cd "${pkgname%-fork}-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  cd "${pkgname%-fork}-$pkgver"
  install -Dm600 examples/inadyn.conf -t "$pkgdir/etc"
  make DESTDIR="$pkgdir" install-strip
}

