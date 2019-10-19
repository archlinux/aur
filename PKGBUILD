# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyflash-bin
pkgname1=skyflash
projectname=skycoin
githuborg=skycoinproject
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.0.5
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=3
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(gzip)
depends=()
source=("https://github.com/skycoin/skyflash/releases/download/Skyflash-v0.0.5-lin/skyflash-gui_linux64-static.gz"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('e3c5cfc8210403b17e6b22a3846d6524576eaf4c93d2d5a19e35f5742ed7abfc'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')

prepare() {
  gpg --import key
  #verify PKGBUILD signature
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
  rm -rf ${srcdir}/skyflash-gui_linux64-static.gz
  cd ..
  gunzip -k skyflash-gui_linux64-static.gz
  mv skyflash-gui_linux64-static ${srcdir}/skyflash-gui
}

package() {
  msg2 'installing files'
  install -Dm755 ${srcdir}/skyflash-gui ${pkgdir}/usr/lib/${projectname}/go/bin/skyflash-gui
  mkdir -p ${pkgdir}/usr/bin
  ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/skyflash-gui ${pkgdir}/usr/bin/skyflash-gui
  chmod 755 ${pkgdir}/usr/bin/skyflash-gui
}
