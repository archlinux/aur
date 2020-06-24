# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-designer
pkgver=10.1.3
pkgrel=1
_build=3687
pkgdesc="Node-based, non-destructive PBR material authoring tool."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.substance3d.com/substance-designer/10.x/Substance_Designer-${pkgver}-${_build}-linux-x64-standard.rpm"
        'substance-designer-icon.png'
        'substance-designer.desktop'
        'substance-designer')
noextract=()
sha256sums=('2457481fa406dfaffb433d713e3cd6c3fe6c5d38015f4631ae99c923ed23818f'
            '8f7f090d96dbb3535747d2c09c32970343c8887df610bc7ef92b59871a9bfb35'
            '7df45269060736a7ae8dcf89abcbcd27371567a5730bdba2a66abf24c90a7157'
            '714d4484f5ca6d1ac0de77729ab60fc6aee53a7dc217fda5a6401fb6f8eee156')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Designer ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt

  # Workaround for https://forum.substance3d.com/index.php/topic,29285.0.html
  # rm ${pkgdir}/opt/Allegorithmic/Substance_Designer/libfreetype.so.6

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-designer-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-designer"
}
