# Maintainer:
# Contributor: twa022 <twa022 at gmail dot com>

## links
# https://www.libreoffice.org/
# https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/

: ${_pkgtype=-dev-bin}
: ${_pkgnamefmt:=LibreOffice}

## basic info
_pkgname="libreoffice"
pkgname="${_pkgname}${_pkgtype:-}"
pkgdesc="A free and powerful office suite - development branch"
pkgver=25.2.0.2
pkgrel=1
url="https://www.libreoffice.org/"
license=('MPL-2.0' 'LGPL-3.0-or-later')
arch=('x86_64')

optdepends=(
  'coin-or-mp: required by the Calc solver'
  'java-environment: required by extension-wiki-publisher and extension-nlpsolver'
  'java-runtime: adds java support'
)

provides=(
  'libreoffice'
  'libreoffice-en-US'
)

options=("!strip" "!debug")

_dl_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64"

source=("$_dl_url/${_pkgnamefmt}_${pkgver}_Linux_x86-64_rpm.tar.gz"{,.asc})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=(
  C2839ECAD9408FBE9531C3E9F434A1EFAFEEAEA3 # LibreOffice Build Team (CODE SIGNING KEY) <build@documentfoundation.org>
)

package() {
  depends+=(
    'dbus'
    'glib2'
    'hicolor-icon-theme'
    'libxml2'
    'python'
  )

  find "$srcdir/${_pkgnamefmt}_${pkgver}"*/RPMS/*rpm -exec bsdtar -x -f '{}' -C "$pkgdir" \;
}
