# Maintainer: Markus Hartung <mail@hartmark.se>
# Contributor: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
pkgname=flashpap
pkgver=1.3.1
pkgrel=2
pkgdesc="A free tool for extracting xPAP sleep data from FlashAir WiFi-enabled SD cards."
arch=('any')
url="http://www.cognitial.com/flashpap/index.htm"
license=('unknown')
depends=(
  'jre8-openjdk'
  'java8-openjfx'
)
makedepends=('unzip')
provides=("$pkgname")

source=(
  'FlashPAP.zip::https://www.cognitial.com/download/flashpap/'
  'flashpap.desktop'
  'flashpap'
)

noextract=('FlashPAP.zip')

sha256sums=('20909247a1e91785a062fef3064643672eb4b3e107a5e012b1bf353c1674448e'
            'f2ec31e34dc8fb6ceb2b714dd485d6302962f516f9570cdca1a751bcc26d1f19'
            'c089e9779d6a9267f9df22e76c3532f0b87a0cee91f74cddb9712fa57ebe3ec5')

prepare() {
  unzip -u FlashPAP.zip
}

package() {
  install -D $srcdir/FlashPAP/FlashPAP.jar $pkgdir/usr/share/java/flashpap/FlashPAP.jar
  rm -f $srcdir/FlashPAP/FlashPAP.jar
  mv FlashPAP $pkgdir/usr/share/flashpap
  install -D $srcdir/flashpap $pkgdir/usr/bin/flashpap
  install -Dm644 $srcdir/flashpap.desktop $pkgdir/usr/share/applications/flashpap.desktop
}
