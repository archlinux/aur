# Maintainer: Blessing-Studio  <Blessing-Studio @ Github>
pkgname=wonderlab-git
_pkgname=WonderLab
pkgver=1.0.1.8
pkgrel=2
epoch=
pkgdesc="下一代跨平台 Minecraft 启动器"
arch=('x86_64')
url="https://github.com/Blessing-Studio/WonderLab"
groups=()
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
options=('!strip' '!emptydirs')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/master.zip" wonderlab.desktop wonderlab.png)
sha512sums=('SKIP' 'db2cc58cc42dc4ef43a93051f9bd09a0c3b346ac597592cb623bf0ae57c77cd856ba8f488dd34fc809a98720da5fd64c75b8e20719c963835dee59300c70f7c3' '346c7db149086ae0baab3b5675a0fc540926b76783f0aa86f0f58754be6eefeb58c408e82416b6f3d12ccc45f68ee2b770e7be3aad29d77b5fe44e697873d137')

build() {
	cd "$_pkgname-master"
	dotnet build --configuration Release
}

package(){

	cd "$_pkgname-master"
	mkdir -p "${pkgdir}/usr/share/WonderLab"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/usr/bin/"
	cp -a WonderLab/bin/Release/net6.0/* "${pkgdir}/usr/share/WonderLab"
	rm -rf ${pkgdir}/usr/share/WonderLab/runtimes/*
	cp -a WonderLab/bin/Release/net6.0/runtimes/linux*x64 "${pkgdir}/usr/share/WonderLab/runtimes/"
	install -Dm644 "../wonderlab.png" "${pkgdir}/usr/share/icons/wonderlab.png"
	ln -sf "/usr/share/WonderLab/WonderLab" "${pkgdir}/usr/bin/WonderLab"
	install -Dm644 "../wonderlab.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	cd ..

}
