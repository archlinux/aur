# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>
# Contributor: reMiND <detanator_at_gmail_com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: trile7 at gmail dot com

pkgname=inadyn-fork
pkgver=2.6
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
provides=('inadyn')
backup=('etc/inadyn.conf')
source=(https://github.com/troglobit/inadyn/releases/download/v$pkgver/${pkgname%-fork}-$pkgver.tar.xz)
sha256sums=('9f4198764abbd2798472b349d8867e86b4692c76ee304f1f9c607f67c9b582a4')

build() {
  cd ${pkgname%-fork}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  cd ${pkgname%-fork}-$pkgver
  install -Dm600 examples/inadyn.conf "$pkgdir/etc/inadyn.conf"
  make DESTDIR="$pkgdir" install-strip
}

