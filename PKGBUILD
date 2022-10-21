# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat
pkgver=4.3.3
pkgrel=1
pkgdesc="Multiplatform CAT tool application, written in Java"
arch=('any')
url="https://www.omegat.org/"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
conflicts=('omegat-beta')
options=('!strip')
source=(http://downloads.sourceforge.net/$pkgname/OmegaT_${pkgver}_Without_JRE.zip
        $pkgname.desktop $pkgname.sh)
sha256sums=('60b3fde6d175e8c5b14631af6740fa28c94a1da7800515e74066f8b2918fe090'
            'ac480a8244c1a5171b7f2d5892585360067d78e3113ccb45aad6afe7ed69aec5'
            '8a6893d382d37c7a12f81370920ca362a8b36e81cec4121942f58613d18b5ade')

package() {
  cd "${srcdir}"/OmegaT_${pkgver}_Without_JRE

  mv *.txt docs/
  install -d "${pkgdir}"/usr/{bin,share/java/${pkgname}}
  cp -r * "${pkgdir}"/usr/share/java/${pkgname}

#.desktop file + icon
  install -Dm644 "${srcdir}"/${pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 images/OmegaT.svg \
    "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg

#executable file
  install -Dm755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}

#removing obsolete files
  rm -rf "${pkgdir}"/usr/share/java/${pkgname}/{*.{zip,desktop,sh,kaptn},OmegaT,OmegaT.bat}
}
