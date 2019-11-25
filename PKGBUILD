# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyflash-bin
pkgname1=skyflash
projectname=skycoin
githuborg=skycoinproject
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.0.6
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(gzip)
depends=()
source=("https://github.com/skycoin/skyflash/releases/download/Skyflash-v0.0.6/Skyflash_Skyflash-v0.0.6_linux_amd64.gz"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('30641fcac0595789a9ee7fb8c533bfdc3d0a5002718ae8eef2e850e30fe5c492'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')

prepare() {
  gpg --import key
  #verify PKGBUILD signature
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
  #Skyflash_Skyflash-v0.0.6_linux_amd64'
}

package() {
  msg2 'installing files'
  install -Dm755 ${srcdir}/Skyflash_Skyflash-v0.0.6_linux_amd64  ${pkgdir}/usr/lib/${projectname}/go/bin/skyflash-gui
  mkdir -p ${pkgdir}/usr/bin
  ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/skyflash-gui ${pkgdir}/usr/bin/skyflash-gui
  chmod 755 ${pkgdir}/usr/bin/skyflash-gui
}
