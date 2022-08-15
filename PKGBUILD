# Maintainer: Ryan Farley <ryan.farley@gmx.com> 
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Scott Fial <scott at fial dot com>

_pkgname=tamsyn-font
pkgname=tamsyn-font-otb
pkgver=1.11
pkgrel=7
pkgdesc="A monospaced bitmap font for the console and X11 (OTB Format)"
arch=('any')
url="http://www.fial.com/~scott/tamsyn-font"
license=('custom')
conflicts=('tamsyn-font')
provides=('tamsyn-font')
makedepends=('fonttosfnt')
depends=('xorg-fonts-encodings')
source=("http://www.fial.com/~scott/$_pkgname/download/$_pkgname-$pkgver.tar.gz")
md5sums=('6ec13672d2f0d6a829f2403cdeebd980')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  for f in *.pcf; do
    fonttosfnt -o "${f/pcf/otb}" "$f"
  done
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/misc"
  install -d "$pkgdir/usr/share/kbd/consolefonts"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m644 *.otb "$pkgdir/usr/share/fonts/misc/"
  install -m644 *.psf.gz "$pkgdir/usr/share/kbd/consolefonts/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/"
}
