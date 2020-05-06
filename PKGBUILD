# Maintainer: t-ask <t-ask-aur at agt24.com>
# Co-maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-painter
pkgver=6.1.1
_build=256
pkgrel=1
pkgdesc="3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://download.substance3d.com/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip') # PNG assets here should be left untouched!
source=("https://download.substance3d.com/substance-painter/6.x/Substance_Painter-${pkgver}-${_build}-linux-x64-standard.rpm"
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
sha256sums=('41e1082e1e19a8af5035c3041ca37b661e5a78724563d78740afaeeb0de7e992'
            'e79b4d09983f355433a16adee7c6b308d9a1824187965d399f33acc68a14f193'
            '5c939be430674e7d61217f4f137a9974ecd38b65a432bc4bab4c64f5f145b4fd'
            'e736a5e160be09cfe1588d349084e2f769815687db080b8c7b790e8751f185f1')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Painter ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Painter/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Painter/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-painter.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-painter-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-painter"
}
