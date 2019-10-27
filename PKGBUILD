# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>
# Co-maintainer: t-ask <t-ask-aur at agt24.com>

pkgname=substance-painter
pkgver=2019.2.3
_build=3402
pkgrel=1
pkgdesc="3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip') # PNG assets here should be left untouched!
source=("https://download.allegorithmic.com/substance-painter/2019.x/Substance_Painter-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
sha256sums=('4e810fdfb2a2730a441c51d38e544228c627f8a1af7aa6b325f4ae2cc3dc8749'
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
