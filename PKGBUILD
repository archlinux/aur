# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-beta
_pkgname=omegat
pkgver=4.1.5_04
pkgrel=1
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('any')
url="http://www.omegat.org/en/omegat.html"
license=('GPL3')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
options=('!strip')
source=(http://downloads.sourceforge.net/${_pkgname}/OmegaT_${pkgver}_Beta_Without_JRE.zip
        ${_pkgname}.desktop ${_pkgname}.sh)
sha256sums=('535d06ab6e47ee91408c4adca370b6e7665ff25014f733ea0811d34889904f07'
            '595de7433e91788e15fa7714e6a65188ccf56eeac824b4a48d50a6752b989700'
            'd543baf2307f9a1849011c6711d1588643bc299e21f75caf330efc2e977989d0')

package() {
  cd "${srcdir}"/OmegaT_${pkgver}_Beta_Without_JRE

  mv *.txt docs/
  install -d "${pkgdir}"/usr/{bin,share/java/${_pkgname}}
  cp -r * "${pkgdir}"/usr/share/java/${_pkgname}

#.desktop file + icon
  install -Dm644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/OmegaT.svg \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.svg

#executable file
  install -Dm755 "${srcdir}"/${_pkgname}.sh "${pkgdir}"/usr/bin/${_pkgname}

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/${_pkgname}/{*.{zip,desktop,sh,kaptn},OmegaT,OmegaT.bat}
}
