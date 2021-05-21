# Maintainer: 9r0k <tanyawei1991@gmail.com>
pkgname=com.pvz.spark
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="pvz from spark store"
arch=('i686' 'x86_64')
url="https://www.ea.com/ea-studios/popcap/plants-vs-zombies"
license=('')
groups=()
depends=('deepin-wine5' 'deepin-wine5-i386' )
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
"http://dcstore.spark-app.store/store/games/plantsvszombies/plantsvszombies_deepin.deb")
md5sums=(
'10d8727eb8f7686d928a20f27781fbac'
)

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	mv "${srcdir}/dpkgdir/opt/apps/plantsvszombies" "${srcdir}/dpkgdir/opt/apps/${pkgname}" 
	mv "${pkgdir}/opt/apps/plantsvszombies" "${pkgdir}/opt/apps/${pkgname}"
    install -m644 "${srcdir}/dpkgdir/opt/apps/${pkgname}/files/files.7z" "${pkgdir}/opt/apps/${pkgname}/files"
    msg "Preparing icons ..."
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/${pkgname}	
    chmod 777 opt/apps/${pkgname}/*
    mv opt/apps/${pkgname}/entries/* usr/share
    rm -r opt/apps/${pkgname}/entries
}
