# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx-bin
pkgname1=cx
projectname=skycoin
githuborg=skycoinproject
pkgdesc="CX Skycoin Blockchain Programming Language; latest binary release"
pkgver=0.7.1
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=5
arch=('x86_64')
url="https://${pkggopath}"
license=()
makedepends=('unzip')
provides=('cx')
conflicts=('cx')
source=("https://${pkggopath}/releases/download/v$pkgver/${pkgname1}-$pkgver-bin-linux-x64.zip"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('99235508f1c5f8df651f89a34e61e418d2c092f037b1210e8541cae16334f2d4'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')

prepare() {
  gpg --import key
  #verify PKGBUILD signature
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
  mkdir -p ${srcdir}/bin
  mv ${pkgname1}-$pkgver-bin-linux-x64.zip ${srcdir}/bin/${pkgname1}-$pkgver-bin-linux-x64.zip
  cd ${srcdir}/bin
  unzip ${pkgname1}-$pkgver-bin-linux-x64.zip
}

package() {
  msg2 'installing CX'
  options=(!strip staticlibs)
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/go/src/github.com/
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname1}/
  ln -s ${pkgdir}/usr/lib/${projectname}/${pkgname1} ${pkgdir}/usr/lib/${projectname}/go/src/github.com/
  install -Dm755 ${srcdir}/home/amherag/go/bin/${pkgname1} ${pkgdir}/usr/lib/${projectname}/go/bin/${pkgname1}
  ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${pkgname1} ${pkgdir}/usr/bin/${pkgname1}
  chmod 755 ${pkgdir}/usr/bin/${pkgname1}
}
