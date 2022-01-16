# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-beta
_pkgname=omegat
pkgver=5.7.0
pkgrel=1
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('any')
url="https://omegat.org/"
license=('GPL3')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
options=('!strip')
source=(http://downloads.sourceforge.net/${_pkgname}/OmegaT_${pkgver}_Beta_Without_JRE.zip
        ${_pkgname}.desktop ${_pkgname}.sh)
sha256sums=('834a859e652b5eab9b1834d06ad8dd092dc606b193a8d85d0733330c8adc8d02'
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
