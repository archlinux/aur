# Maintainer: Blessing-Studio  <Blessing-Studio @ Github>
pkgname=wonderlab-git
_pkgname=WonderLab.Override
pkgver=1.2.6
pkgrel=1
epoch=
pkgdesc="下一代跨平台 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/Blessing-Studio/WonderLab.Override"
groups=()
license=('AGPL3')
depends=()
makedepends=('dotnet-sdk-bin' 'dotnet-runtime-bin')
options=('!strip' '!emptydirs')
conflicts=('wonderlab')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/master.tar.gz")
sha512sums=('SKIP')
build() {
	cd "$_pkgname-master"
	dotnet publish wonderlab/wonderlab.csproj --configuration Release --arch x64 --os linux -p:PublishSingleFile=false --sc true
}

package(){
	cd "$_pkgname-master"
	mkdir -p "${pkgdir}/usr/share/WonderLab"
	mkdir -p "${pkgdir}/usr/share/icons/"
	cp -a wonderlab/bin/Release/net7.0/linux-x64/publish/* "${pkgdir}/usr/share/WonderLab"
	cp -a "wonderlab/bin/Release/net7.0/linux-x64/publish/Assets/wonderlab.png" "${pkgdir}/usr/share/icons/wonderlab.png"
	install -Dm644 "wonderlab/bin/Release/net7.0/linux-x64/publish/wonderlab.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	rm -rf wonderlab/bin wonderlab/obj
}
