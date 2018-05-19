# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pikopixel
pkgver=1.0.b9c
pkgrel=1
pkgdesc="A free, open-source application for drawing & editing pixel-art images"
arch=('x86_64')
url="http://twilightedge.com/mac/pikopixel/"
license=('AGPL3')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gnustep-make' 'gcc-objc')
source=("http://twilightedge.com/downloads/PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}.tar.gz")
sha256sums=('aa8d6d235d060f660ef4be00f3d007f406c342fd0e44659d51ad161baa4f5c2c')
# They block some user agents like wget or curl. m( Let's call them stupid and see if they block us too... ;)
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -A YourUserAgentBlockerIsStupid -o %o %u')

build() {
  cd PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}/PikoPixel

  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
}

package() {
  cd PikoPixel.Sources.${pkgver%.*}-${pkgver##*.}/PikoPixel

  make DESTDIR="$pkgdir" install

  # .desktop entry
  install -Dm0644 PikoPixel.app/Resources/PikoPixel.desktop "$pkgdir"/usr/share/applications/PikoPixel.desktop
}
