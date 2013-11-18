# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: JD Steffen

pkgname=eduke32
pkgver=20131116_4167
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl_mixer' 'mesa' 'libvpx' 'libvorbis' 'flac' 'gtk2')
makedepends=('nasm')
# nasm is x86-only
[ "$CARCH" == "x86_64" ] && makedepends=()
optdepends=('eduke32-hrp: High Resolution Pack'
            'eduke32-dukeplus: Enhanced Mod'
            'timidity-freepats: free soundfont for music'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
conflicts=('eduke32-svn')
install="$pkgname.install"
source=("http://dukeworld.duke4.net/$pkgname/synthesis/${pkgver//_/-}/${pkgname}_src_${pkgver//_/-}.tar.xz"
        "$pkgname.png"
        "$pkgname.desktop")
md5sums=('a92fd7139e626de94f220e4ffe512c0f'
         'bc189b860c8562e10f01e0faed909089'
         'SKIP')
sha256sums=('76712e125e6f9a52d7f3249a1ab3b29f1b2eb0c2d98212579a074c954d57f054'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            'SKIP')

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
  install -Dm644 "package/common/buildlic.txt" "$pkgdir/usr/share/licenses/$pkgname/buildlic.txt"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
