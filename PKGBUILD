# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-designer
pkgver=2018.3.4
_build=2204
pkgrel=1
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.allegorithmic.com/substance-designer/2018.x/Substance_Designer-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-designer-icon.png'
        'substance-designer.desktop'
        'substance-designer')
sha256sums=('c96a127f9628d54bf66ea0c75da136cbc63ede8241d3d68c792bdf47c24d1d8c'
            '8f7f090d96dbb3535747d2c09c32970343c8887df610bc7ef92b59871a9bfb35'
            'daa6c087c1d6ee2c80d55d1600eb3b18d597b94d490effed406c553213781703'
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
