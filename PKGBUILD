# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Arkham, Christoph Zeiler, JD Steffen

pkgname=eduke32
_pkgdate=20140622
_pkgrev=4523
pkgver=$_pkgdate.r$_pkgrev
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
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
sha256sums=('151f086be1846a85239f8374d1881f663a8a4aa37cd89d93dab9ef48dd97340b'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            '9224aadf634448726d2e863ba9a455887dc3b90049238fe592b7f7b5634cbd79')

build() {
  cd ${pkgname}_$_pkgdate-$_pkgrev

  # add our makeflags and explicitly disable c++ building with sdl 2
  make debug="$CXXFLAGS" CPLUSPLUS=0 SDL_TARGET=2
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
