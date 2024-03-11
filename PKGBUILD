# Maintainer:
# Contributor: twa022 <twa022 at gmail dot com>

## useful links:
# https://www.libreoffice.org/
# https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/

## basic info
_pkgname="libreoffice"
pkgname="${_pkgname}-dev-bin"
pkgver=24.2.2.1
pkgrel=1
pkgdesc="LibreOffice development branch"
url="https://www.libreoffice.org/"
arch=('x86_64')
license=('MPL-2.0' 'LGPL-3.0-or-later')

optdepends=(
  'coin-or-mp: required by the Calc solver'
  'java-environment: required by extension-wiki-publisher and extension-nlpsolver'
  'java-runtime: adds java support'
)

provides=(
  'libreoffice'
  'libreoffice-en-US'
)

_pkgnamefmt=LibreOffice

_dl_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64"
source=("$_dl_url/${_pkgnamefmt}_${pkgver}_Linux_x86-64_rpm.tar.gz"{,.asc})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=(
  C2839ECAD9408FBE9531C3E9F434A1EFAFEEAEA3  # LibreOffice Build Team (CODE SIGNING KEY) <build@documentfoundation.org>
)

package() {
  depends+=(
    'curl'
    'gtk3'
    'lpsolve'
    'neon'
  )

  find "$srcdir/${_pkgnamefmt}_${pkgver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "$pkgdir" \;
}
