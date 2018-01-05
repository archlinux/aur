# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: David Herrmann <dh.herrmann@googlemail.com>
pkgname=kmscon
pkgver=8
pkgrel=3
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=(x86_64)
url='http://www.freedesktop.org/wiki/Software/kmscon/'
license=('MIT')
depends=(systemd libdrm mesa libgl pango libxkbcommon xkeyboard-config libtsm)
makedepends=(libxslt docbook-xsl linux-api-headers)
source=(http://www.freedesktop.org/software/kmscon/releases/kmscon-${pkgver}.tar.xz)
md5sums=('90d39c4ef53a11c53f27be4a7e9acee4')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/systemd/system"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  cp docs/kmscon{,vt@}.service "$pkgdir/usr/lib/systemd/system/"
}
