# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-designer
pkgver=2019.1.0
_build=2273
pkgrel=1
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.allegorithmic.com/substance-designer/2019.x/Substance_Designer-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-designer-icon.png'
        'substance-designer.desktop'
        'substance-designer')
sha256sums=('f3cc3cc2f2248021543a4683b51d226f4aedd38f5a56e6f8b9dc497f24cd4a60'
            '8f7f090d96dbb3535747d2c09c32970343c8887df610bc7ef92b59871a9bfb35'
            '223b641960e9fab3e8ba67e171c84e91ebe6f171a748b9036e4bc97fd4ec6cae'
            '714d4484f5ca6d1ac0de77729ab60fc6aee53a7dc217fda5a6401fb6f8eee156')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Designer ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-designer-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-designer"
}
