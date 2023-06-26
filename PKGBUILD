# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
pkgname=omegat-beta
_pkgname=omegat
pkgver=6.0.0
pkgrel=1
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('any')
url="https://omegat.org/"
license=('GPL3')
depends=('java-runtime>=11' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
options=('!strip')
source=(http://downloads.sourceforge.net/${_pkgname}/OmegaT_${pkgver}_Without_JRE.zip
        ${_pkgname}.sh)
sha256sums=('5359befba67e6c9eb8ad882a28795adc628300e2702639c822e44a1f48d7406b'
            '8a6893d382d37c7a12f81370920ca362a8b36e81cec4121942f58613d18b5ade')

package() {
  cd "${srcdir}"/OmegaT_${pkgver}_Without_JRE

  mv *.txt docs/
  install -d "${pkgdir}"/usr/{bin,share/java/${_pkgname}}
  cp -r * "${pkgdir}"/usr/share/java/${_pkgname}

#.desktop file + icon
  install -Dm644 "${srcdir}"/OmegaT_${pkgver}_Without_JRE/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/OmegaT.svg \
    "${pkgdir}"/usr/share/pixmaps/${_pkgname}.svg

#executable file
  install -Dm755 "${srcdir}"/${_pkgname}.sh "${pkgdir}"/usr/bin/${_pkgname}

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/${_pkgname}/{*.{zip,desktop,sh,kaptn},OmegaT,OmegaT.bat}
}
