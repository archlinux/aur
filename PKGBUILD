# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-beta
_pkgname=omegat
pkgver=5.2.0
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
sha256sums=('e051dfcab3c9852d3aea3ce2b4029ab4dc2322cb10020ac74b6803094a4dab9f'
            '595de7433e91788e15fa7714e6a65188ccf56eeac824b4a48d50a6752b989700'
            '8a6893d382d37c7a12f81370920ca362a8b36e81cec4121942f58613d18b5ade')

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
