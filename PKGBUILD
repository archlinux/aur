# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: blu256 <mfilippos@yandex.ru>
# Contributer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=ude
pkgver=0.2.11b
pkgrel=1
pkgdesc="The ultimate window manager for UDE"
arch=('x86_64')
license=('GPL')
depends=('libjpeg' 'libxmu' 'libxpm' 'bash')
makedepends=('gendesk')
url="http://udeproject.sourceforge.net/index.shtml"
source=(http://downloads.sourceforge.net/udeproject/uwm-${pkgver/_/}.tar.gz)
sha256sums=('661f29f2c1718e5c1b046b2bd16e335bce723b7d67f2209b922e0ec47ecd98ee')

build() {
  cd "$srcdir"
  gendesk -n --pkgname=uwm --name=UWM --pkgdesc="$pkgdesc"

  cd "uwm-${pkgver/_/}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/uwm-${pkgver/_/}"

  make prefix="$pkgdir/usr" install
  install -Dm644 "$srcdir/uwm.desktop" "$pkgdir/usr/share/xsessions/uwm.desktop"
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
}
