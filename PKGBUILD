# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx-bin
_pkgname=cx
_projectname=skycoin
_githuborg=${_projectname}
pkgdesc="CX Blockchain Programming Language; latest binary release. skycoin.com/cx"
pkgver=0.7.1
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=7
arch=('x86_64')
url="https://${_pkggopath}"
license=()
makedepends=('unzip')
provides=('cx')
conflicts=('cx')
#https://github.com/skycoin/cx/releases/download/v0.7.1/cx-0.7.1-bin-linux-x64.zip
source=("https://${_pkggopath}/releases/download/v${pkgver}/${_pkgname}-$pkgver-bin-linux-x64.zip")
sha256sums=('99235508f1c5f8df651f89a34e61e418d2c092f037b1210e8541cae16334f2d4')
#validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
#                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>

prepare() {
  #verify PKGBUILD signature
#  gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
  mkdir -p ${srcdir}/bin
  mv ${_pkgname}-${pkgver}-bin-linux-x64.zip ${srcdir}/bin/${_pkgname}-${pkgver}-bin-linux-x64.zip
  cd ${srcdir}/bin
  unzip ${_pkgname}-${pkgver}-bin-linux-x64.zip
}

package() {
  _msg2 'installing CX'
  options=(!strip staticlibs)
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt/${_pkgname}/bin
  mkdir -p ${pkgdir}/usr/lib/${_projectname}/go/src/github.com/
  mkdir -p ${pkgdir}/usr/lib/${_projectname}/${_pkgname}/
  ln -s ${pkgdir}/usr/lib/${_projectname}/${_pkgname} ${pkgdir}/usr/lib/${_projectname}/go/src/github.com/
  install -Dm755 ${srcdir}/home/amherag/go/bin/${_pkgname} ${pkgdir}/usr/lib/${_projectname}/go/bin/${_pkgname}
  ln -rTsf ${pkgdir}/usr/lib/${_projectname}/go/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  chmod 755 ${pkgdir}/usr/bin/${_pkgname}
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
