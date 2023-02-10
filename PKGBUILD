# Maintainer: Blessing-Studio  <Blessing-Studio @ Github>
pkgname=wonderlab-git
_pkgname=WonderLab
pkgver=1.0.2.3
pkgrel=1
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
sha512sums=('SKIP' 'db2cc58cc42dc4ef43a93051f9bd09a0c3b346ac597592cb623bf0ae57c77cd856ba8f488dd34fc809a98720da5fd64c75b8e20719c963835dee59300c70f7c3' '756b1834d5dbd0ea6b4b3a1172512872d5d1ba833bc1a1491b52f8fa94671efb38060cde58bfcc8a6b43b41b1d14cf6f99dacb0a33833d2ce586a71e95854143')

build() {
	cd "$_pkgname-master"
	dotnet build --configuration Release
}

package(){

	cd "$_pkgname-master"
	mkdir -p "${pkgdir}/usr/share/WonderLab"
	mkdir -p "${pkgdir}/usr/share/icons/"
	mkdir -p "${pkgdir}/usr/bin/"
	rm -rf WonderLab/bin/Release/net6.0/runtimes/{*arm*,osx,win*,unix,*musl*}
	cp -a WonderLab/bin/Release/net6.0/* "${pkgdir}/usr/share/WonderLab"
	cp "../../wonderlab.png" "${pkgdir}/usr/share/icons/wonderlab.png"
	ln -sf "/usr/share/WonderLab/WonderLab" "${pkgdir}/usr/bin/WonderLab"
	install -Dm644 "../wonderlab.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	cd ..

}
