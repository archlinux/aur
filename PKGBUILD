# Maintainer: Blessing-Studio  <Blessing-Studio @ Github>
pkgname=wonderlab-git
_pkgname=WonderLab.Override
pkgver=1.2.8
pkgrel=1
epoch=
pkgdesc="下一代跨平台 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/Blessing-Studio/WonderLab.Override"
groups=()
license=('AGPL3')
depends=()
makedepends=('dotnet-sdk' 'dotnet-runtime')
options=('!strip' '!emptydirs')
conflicts=('wonderlab')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/master.tar.gz" "wonderlab.desktop")
sha512sums=('SKIP' 'f1bdc93d55f94d55eafc648bd94d38120535ba81cc7078ee90de55f9506e16efbdfb7fab5d413e1d1800e13a9b1d85445a726bee6b646011772044edcc4210ba')
build() {
	cd "$_pkgname-master"
	dotnet publish wonderlab/wonderlab.csproj --configuration Release --arch x64 --os linux -p:PublishSingleFile=false --sc true
}

package(){
	cd "$_pkgname-master"
	mkdir -p "${pkgdir}/usr/bin/WonderLab.Override"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/usr/bin/"
	cp -a wonderlab/bin/Release/net7.0/linux-x64/publish/* "${pkgdir}/usr/bin/WonderLab.Override"
	cp -a "wonderlab/bin/Release/net7.0/linux-x64/publish/Assets/wonderlab.png" "${pkgdir}/usr/share/icons/wonderlab.png"
	install -Dm644 ../../wonderlab.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
	rm -rf wonderlab/bin wonderlab/obj
}
