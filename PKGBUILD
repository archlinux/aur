# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-designer
pkgver=2017.2.5
_build=993
pkgrel=1
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip' '!optipng') # PNG assets here should be left untouched!
source=("https://download.allegorithmic.com/substance-designer/2017.x/Substance_Designer-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-designer-icon.png'
        'substance-designer.desktop'
        'substance-designer')
sha256sums=('fa96504c40d9d6ddba889745f99feae920452c007694fe40b7749dab44c2f913'
            '8f7f090d96dbb3535747d2c09c32970343c8887df610bc7ef92b59871a9bfb35'
            'e3fcd046859ac86a4944ebe9aba461d5a3845147a68171baf7f82b05160da295'
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
