# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=discreet
_pkgname=${pkgname}
_githuborg="DiscreetNetwork"
pkgdesc="Discreet Cryptocurrency Wallet. discreet.net"
pkgver=0.0.1
pkgrel=1
arch=('x86_64')
depends=('dotnet-sdk')
_pkgpath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkgpath}"
source=("${url}/archive/refs/heads/master.zip")
sha256sums=('1cec76252c3e7944d0c4b6e0009fc01ec6e3b8e01675172a41bde98354e0239c')


build() {
	cd ${srcdir}/Discreet-master/Discreet
dotnet publish --configuration Release --runtime linux-x64 --framework net6.0 --self-contained true
}

package() {
	#create directory trees
	_path=${pkgdir}/opt/${_pkgname}
	install -dm755 ${pkgdir}/usr/bin
	install -dm755 ${_path}
	cp -a ${srcdir}/Discreet-master/Discreet/bin/Release/net6.0/linux-x64/* ${_path}/
	ln -rTsf ${_path}/${_pkgname^} ${pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${pkgdir}/usr/bin/${i}
}
