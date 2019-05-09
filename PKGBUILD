# Maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-alchemist
pkgver=0.6.1.rc1
pkgrel=1

# pkgver can't contain dashes etc, so we have to simplify that for now (until Alchemist is released for real).
# _flavor looks like something that will change, previous packages usually had the standard-full/commercial suffix
_version=0.6.1-rc.1
_build=150
_flavor=Release-9066669c

pkgdesc="Experimental PBR material authoring, generation, manipulation and management tool"
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-alchemist'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.allegorithmic.com/substance-alchemist/0.x/Substance_Alchemist-${_version}-${_build}-linux-x64-${_flavor}.rpm"
        'substance-alchemist-icon.png'
        'substance-alchemist.desktop'
        'substance-alchemist')
sha256sums=('844ab3d4f0b0021c0ec8c4ace5ba033624edf49f4f460038eef8c8628639b82f'
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
