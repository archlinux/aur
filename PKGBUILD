# Maintainer: johnpyp <johnpyp.dev@gmail.com>

# To increment version/make changes:
# update pkgver
# `updpkgsums` to update checksums
# `makepkg --printsrcinfo > .SRCINFO` to update the srcinfo
# `makepkg -si` to install the package locally and test it out
pkgname=audiobookconverter-bin
pkgver=6.1.0
pkgrel=1
epoch=
pkgdesc="Improved AudioBookConverter based on freeipodsoftware release (mp3 to m4b converter)"
arch=("x86_64")
url="https://github.com/yermak/AudioBookConverter"
license=('GPL2')
groups=()
depends=()
provides=('audiobookconverter')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/yermak/AudioBookConverter/releases/download/version_${pkgver}/AudioBookConverter-static-binaries-${pkgver}.tar.gz"
        "audiobookconverter-AudioBookConverter.desktop")
sha512sums=('f1f31e2e5d8764217ee56d37aff5aa372857f15f5978e6e54063efc154bbea586e72156762e8e59a3becfd5549258963e792a6da40663eefd5d273cdf51b8156'
            '6fafcfac49c8e7a0e2e0f2305f4812de6342a692f3a8cf7523f1d2decf49731e5ab60235ea4ecab5a9ea53c2a6463cff8fb08bc01a8ffd8b8f98f2bea80cfa6a')

package() {
  install -dm0755 "${pkgdir}/opt/"

  cp -r "${srcdir}/AudioBookConverter" "${pkgdir}/opt/audiobookconverter"

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf "/opt/audiobookconverter/bin/AudioBookConverter" "${pkgdir}/usr/bin/audiobookconverter"

  cp -dpr --no-preserve=ownership "${pkgdir}/opt/audiobookconverter/lib" "${pkgdir}/usr/lib"

  install -Dm644 "${srcdir}/audiobookconverter-AudioBookConverter.desktop" "${pkgdir}/usr/share/applications/audiobookconverter.desktop"
}
