# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: JD Steffen

pkgname=eduke32
# mind the underscore!
pkgver=20130915_4065
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl_mixer' 'mesa' 'libvpx' 'gtk2' 'desktop-file-utils')
makedepends=('nasm')
# no need for nasm on 64bit
[ "$CARCH" == "x86_64" ] && makedepends=()
optdepends=('eduke32-hrp: High Resolution Pack' 'eduke32-dukeplus: Enhanced Mod' 'timidity-freepats: free soundfont for music' 'eduke32-shareware-episode: Duke Nukem 3D Demo')
conflicts=('eduke32-svn')
install="$pkgname.install"
source=("http://dukeworld.duke4.net/$pkgname/synthesis/${pkgver//_/-}/${pkgname}_src_${pkgver//_/-}.tar.bz2"
        "$pkgname.png"
        "$pkgname.desktop"
        "$pkgname.install")
md5sums=('7f225c0fd725c5aefb83b67c942d0b12'
         'bc189b860c8562e10f01e0faed909089'
         '244895de9c74550c1bb079793d8b18fe'
         '52fe1aacaa53e04587d16e05252fd714')
sha256sums=('49dae0a559d93b0f8857f6e1feb73529c142d32dc2a6b74c5747983d5471fdfa'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            '9224aadf634448726d2e863ba9a455887dc3b90049238fe592b7f7b5634cbd79'
            'ff05c37c046c5ab0456ff6307bfe9cef3eb8579ab8124a418e973378c9215158')

build() {
  cd "$srcdir/${pkgname}_${pkgver//_/-}"

  # add our makeflags and explicitly disable c++ building for now
  make debug="${CXXFLAGS}" CPLUSPLUS=0
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
