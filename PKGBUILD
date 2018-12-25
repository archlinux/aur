# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>
# Co-maintainer: t-ask <t-ask-aur at agt24.com>

pkgname=substance-painter
pkgver=2018.3.1
_build=2619
pkgrel=1
pkgdesc="3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip') # PNG assets here should be left untouched!
source=("https://download.allegorithmic.com/substance-painter/2018.x/Substance_Painter-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
sha256sums=('3eea541577ebd49658d894143f59a66e0c94d4098c3e50e5aa64aa63e62fb9f8'
            '6744c1fbe8e9fb1fb91bd291e3ef8ac645bbfec1aa97915f440e6fbfebf4edbd'
            '7cabf143456de30f376568bc4d79fd7572b788221d42d62bd124c82db93daae6'
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
