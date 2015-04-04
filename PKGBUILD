# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=unepic-hib
pkgver=1.50.5
pkgrel=1
pkgdesc='A combination of platforming and role playing games with many hilarious references. It takes place in Harnakon, a huge medieval castle.'
url="http://www.unepicgame.com/en/game.html"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh' 'sdl2_mixer' 'libogg' 'glew')
source=("hib://unepic-15005.run"
        "$pkgname.sh")
sha256sums=('11866de3bfdcac950c5bc29b6b5ff807e64307afef0b7f642378ccfcf2a073c8'
            '2e045f5cf056a3498acaf2dd03811f38a5fc87b10ae55160c53f6634494109ad')
PKGEXT=".pkg.tar"

package() {
  # data
  for _f in data image sound voices/english voices/spanish; do
    install -d "$pkgdir"/opt/unepic/$_f
    install -m644 data/$_f/* "$pkgdir"/opt/unepic/$_f
  done
  install -m644 data/voices/text.txt "$pkgdir"/opt/unepic/voices
  install -m644 data/unepic.png "$pkgdir"/opt/unepic

  # binary
  case $CARCH in
    i686)
      install -m755 data/unepic32 "$pkgdir"/opt/unepic/unepic;;
    x86_64)
      install -m755 data/unepic64 "$pkgdir"/opt/unepic/unepic;;
  esac

  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/unepic
}
