# Maintainer:
# Contributor: twa022 <twa022 at gmail dot com>

_pkgnamefmt=LibreOfficeDev
_pkgname=libreoffice
pkgname=${_pkgname}-dev-bin
_LOver=24.2.0.0.beta1
pkgver=24.2.0.0beta1
#_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )
pkgrel=1
pkgdesc="LibreOffice development branch"
url="https://www.libreoffice.org/"
arch=('x86_64')
license=('LGPL3')

optdepends=(
  'coin-or-mp: required by the Calc solver'
  'java-environment: required by extension-wiki-publisher and extension-nlpsolver'
  'java-runtime: adds java support'
  'kio5: for Qt5 integration'
)

provides=(
  'libreoffice'
  'libreoffice-en-US'
)

_dl_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64"
source=("$_dl_url/${_pkgnamefmt}_${_LOver}_Linux_x86-64_rpm.tar.gz")
sha256sums=('SKIP')

package() {
  depends+=(
    'curl'
    'gtk3'
    'lpsolve'
    'neon'
  )

  find "${srcdir:?}/${_pkgnamefmt}_${_LOver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "${pkgdir:?}" \;
}
