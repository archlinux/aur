# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
pkgname=omegat-beta
_pkgname=omegat
pkgver=6.0.0
pkgrel=2
pkgdesc="Beta version of a multiplatform CAT tool application, written in Java"
arch=('any')
url="https://omegat.org/"
license=('GPL3')
depends=('java-runtime>=11' 'desktop-file-utils')
conflicts=('omegat')
provides=('omegat')
options=('!strip')
source=(https://downloads.sourceforge.net/project/${_pkgname}/OmegaT%20-%20Standard/OmegaT%20${pkgver}/OmegaT_${pkgver}_Without_JRE.zip
        ${_pkgname}.sh)
sha256sums=('76c6d3e62b9906e7542f82b0e2b76f8b8cbdf2672f9d8363f6346f0b9c09a182'
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
