# Maintainer:  dreieck
# Contributor: fordprefect (https://aur.archlinux.org/account/fordprefect)

### Based on the `PKGBUILD` for the package "raccoon-bin" by fordprefect (https://aur.archlinux.org/account/fordprefect).

_pkgbase='dummydroid'
_pkgname="${_pkgbase}"
pkgbase="${_pkgbase}-bin"
pkgname="${_pkgname}-bin"
groups=("raccoon")
pkgver=3.0
pkgrel=2
arch=('any')
pkgdesc="A compagnion tool for Raccoon, to spoof arbitrary Android devices and generate a GSF ID / User Agent String for them, and check if a given proxy server is suitable for downloading geo blocked apps. It also allows web browser based login for Racoon. "
url="https://raccoon.onyxbits.de/dummydroid/"
license=('Apache')
depends=(
  'java-runtime'
  'sh'
)
optdepends=('raccoon')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "https://raccoon.onyxbits.de/${_pkgbase}/${_pkgname}-${pkgver}.jar"
  "${_pkgname}.sh.in"
  "${_pkgname}.desktop"
)
## Do extract in order to get the icon.
# noextract=(
#   "${_pkgname}-${pkgver}.jar"
# )
sha256sums=(
  '28520aa8dad9f69a585b8469f3d0ce76a5531b5a4a85c377798619a5754466cc'
  '81b5bdb9e94338578977bc60eeaf68da0c65d817c581a59ccf47579e03810d1a'
  '0b39f6793ce5f8acb7041e12080f0a7983c2d0c71ba4ccf44755a005e353f51a'
)

build() {
  cd "${srcdir}"

  # Create launcher script.
  sed -e "s|%%_PKGNAME%%|${_pkgname}|g" -e "s|%%PKGVER%%|${pkgver}|g" "${_pkgname}.sh.in" > "${_pkgname}.sh"
  chmod 755 "${_pkgname}.sh"
}

package() {
  cd "${srcdir}"

  # install files to java shared dir
  install -Dvm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}-${pkgver}.jar"

  # install icon and desktop database entry
  install -Dvm644 "de/onyxbits/raccoon/dummydroid/appicon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -Dvm644 "${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # starter
  install -Dvm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
