# Maintainer: t-ask <t-ask-aur at cixera.com>

pkgname=substance-alchemist
pkgver=2.2.0
pkgrel=1

_main=2
_build=rc.3-64
_tag=2f489679

pkgdesc="Experimental PBR material authoring, generation, manipulation and management tool"
arch=('x86_64')
url='https://www.substance3d.com/products/substance-alchemist'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.substance3d.com/substance-alchemist/${_main}.x/Substance_Alchemist-${pkgver}-${_build}-linux-x64-standard-Release-${_tag}.rpm"
        'substance-alchemist-icon.png'
        'substance-alchemist.desktop'
        'substance-alchemist')
sha256sums=('0e42d28bba0f3084ccc0307987c1f94c3fd6b5940e1911a2b1ba017ac009ee74'
            'b0c9cc1be9e784641810e163d4f580dba45c36ecc73381988317c2cec4e93276'
            '17350182c0f7527be52db14f3a92f8074a7ea69857d6088c198478943132c8a4'
            '4aabc0246f0e985d278ce5773c39b378d7b5117430c029cd4da069175c5c2c1b')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Alchemist ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Alchemist/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Alchemist/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-alchemist.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-alchemist-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-alchemist"
}
