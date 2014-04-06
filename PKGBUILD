# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: JD Steffen

pkgname=eduke32
_pkgdate=20140401
_pkgrev=4411
pkgver=${_pkgdate}_$_pkgrev
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
makedepends=('mesa' 'glu')
# nasm is x86-only
[ "$CARCH" == "i686" ] && makedepends+=('nasm')
optdepends=('eduke32-hrp: High Resolution Pack'
            'eduke32-dukeplus: Enhanced Mod'
            'timidity-freepats: a free soundfont for music'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
install=$pkgname.install
source=("http://dukeworld.duke4.net/$pkgname/synthesis/$_pkgdate-$_pkgrev/${pkgname}_src_$_pkgdate-$_pkgrev.tar.xz"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('26f5d2f220b45f36e492bc8421e1e034a2f9881f984c990cfa217e809b2ff157'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            '9224aadf634448726d2e863ba9a455887dc3b90049238fe592b7f7b5634cbd79')

build() {
  cd ${pkgname}_$_pkgdate-$_pkgrev

  # add our makeflags and explicitly disable c++ building with sdl 1.2
  make debug="$CXXFLAGS" CPLUSPLUS=0 SDL_TARGET=1
}

package() {
  cd ${pkgname}_$_pkgdate-$_pkgrev

  # install binaries, buildlicense, icon and desktop files
  install -d "$pkgdir"/usr/bin
  install -m755 eduke32 mapster32 "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
