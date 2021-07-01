# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.pvz.spark
pkgver=1.0
pkgrel=3
epoch=
pkgdesc="pvz from spark store"
arch=('i686' 'x86_64')
url="https://www.ea.com/ea-studios/popcap/plants-vs-zombies"
license=('')
groups=()
depends=('deepin-wine5' 'deepin-wine5-i386' 'p7zip' 'deepin-wine-helper')
checkdepends=()
optdepends=()
provides=("spark")
conflicts=("spark")
replaces=("spark")
backup=()
options=()
install=pvz.install
changelog=
source=(
"https://store.deepinos.org.cn/store/games/plantsvszombies/plantsvszombies_deepin.deb"
run.sh
plantvszombies.desktop)
md5sums=(
'10d8727eb8f7686d928a20f27781fbac'
'7e963f6aa426391b8abfb02326b2a4ed'
'326d45fc44a2b308713ac90ccc6ccb4c')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  rm "${srcdir}/dpkgdir/opt/apps/plantsvszombies/files/run.sh"
  cp "${srcdir}/run.sh" "${srcdir}/dpkgdir/opt/apps/plantsvszombies/files/"
  rm "${srcdir}/dpkgdir/opt/apps/plantsvszombies/entries/applications/plantvszombies.desktop"
  cp "${srcdir}/plantvszombies.desktop" "${srcdir}/dpkgdir/opt/apps/plantsvszombies/entries/applications/"
  }


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	mv "${pkgdir}/opt/apps/plantsvszombies" "${pkgdir}/opt/apps/${pkgname}"
    cp "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    cp "${srcdir}/plantvszombies.desktop" "${pkgdir}/opt/apps/${pkgname}/entries/applications/"
	install -m644 "${srcdir}/dpkgdir/opt/apps/plantsvszombies/files/files.7z" "${pkgdir}/opt/apps/${pkgname}/files"
    msg "Preparing icons ..."
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/${pkgname}	
    chmod 777 opt/apps/${pkgname}/*
    mv opt/apps/${pkgname}/entries/* usr/share
    rm -r opt/apps/${pkgname}/entries
}
