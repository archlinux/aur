# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: z3475 <z3475@foxmail.com>
pkgname=bluedivision-bin
_pkgname=bluedivision
pkgver=1.3.1
pkgsuffix=
pkgrel=1
pkgdesc="A fanmade blue archive game heavily inspired by 'Tom Clancy's The Division'."
arch=('x86_64')
url="https://github.com/WhatIsThisG/BlueDivision_Release"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/WhatIsThisG/BlueDivision_Release/releases/download/v1.31/Blue.Division.v1.31.linux.tar.gz"
  "${_pkgname}.png"
)
sha256sums=(
  '98b64f13a59ce982d23e20b556a6ca083b5950429feacd2fe2683e147612e06d'
  'd803a71e2d1e1e471968a1265c46e731d3c13dd50515dc939caab973415e72c6'
)
outdir="/opt/$_pkgname"
shopt -s extglob

prepare() {
  rm ${_pkgname}-${pkgver}.tar.gz;
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" --exec="'${outdir}/Blue_Division.x86_64'"
}

package() {
  outpkgdir="${pkgdir}${outdir}"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  mkdir -p "$outpkgdir"
  cp -r "${srcdir}"/!(${_pkgname}.desktop|${_pkgname}.png) "$outpkgdir/"
}
