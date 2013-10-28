# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: JD Steffen

pkgname=eduke32
pkgver=20131027_4120
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl_mixer' 'mesa' 'libvpx' 'gtk2' 'desktop-file-utils')
makedepends=('nasm')
# nasm is x86-only
[ "$CARCH" == "x86_64" ] && makedepends=()
optdepends=('eduke32-hrp: High Resolution Pack'
            'eduke32-dukeplus: Enhanced Mod'
            'timidity-freepats: free soundfont for music'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
conflicts=('eduke32-svn')
install="$pkgname.install"
source=("http://dukeworld.duke4.net/$pkgname/synthesis/${pkgver//_/-}/${pkgname}_src_${pkgver//_/-}.tar.bz2"
        "$pkgname.png"
        "$pkgname.desktop"
        "$pkgname.install")
md5sums=('71197176839f0e6bf39c537fe7d0113f'
         'bc189b860c8562e10f01e0faed909089'
         '244895de9c74550c1bb079793d8b18fe'
         '52fe1aacaa53e04587d16e05252fd714')
sha256sums=('2fde3bafef5e301c5d2b7a2f46faa04306423eb3b74aba7e94bbdb4248fc59fa'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            '9224aadf634448726d2e863ba9a455887dc3b90049238fe592b7f7b5634cbd79'
            'ff05c37c046c5ab0456ff6307bfe9cef3eb8579ab8124a418e973378c9215158')

build() {
  cd "$srcdir/${pkgname}_${pkgver//_/-}"

  # add our makeflags and explicitly disable c++ building with sdl 1.2
  make debug="${CXXFLAGS}" CPLUSPLUS=0 SDL_TARGET=1
}

package() {
  cd "$srcdir/${pkgname}_${pkgver//_/-}"

  # install binaries, buildlicense, icon and desktop files
  install -d "$pkgdir/usr/bin"
  install -m755 "eduke32" "mapster32" "$pkgdir/usr/bin/"
  install -Dm644 "package/buildlic.txt" "$pkgdir/usr/share/licenses/$pkgname/buildlic.txt"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
