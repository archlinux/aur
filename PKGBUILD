# Maintainer: MCSeekeri <mcseekeri@outlook.com>
pkgname=wonderlab-git
_pkgname=WonderLab
pkgver=1.0.1.8
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
sha512sums=('SKIP' 9501b7df25f72e38a7e62fec7df3565116cb365e6e2732b3bbf828dd3afdf094797c4ccdb4764ad9b37a69609ff86baeafe4ca14aace6f0c78dd55f8bdd0d666 346c7db149086ae0baab3b5675a0fc540926b76783f0aa86f0f58754be6eefeb58c408e82416b6f3d12ccc45f68ee2b770e7be3aad29d77b5fe44e697873d137)

build() {
	cd "$_pkgname-master"
	dotnet build --configuration Release
}

package(){

	cd "$_pkgname-master"
	mkdir -p "${pkgdir}/usr/share/WonderLab"
	mkdir -p "${pkgdir}/usr/share/icons/"
	cp -a WonderLab/bin/Release/net6.0/* "${pkgdir}/usr/share/WonderLab"
	rm -rf "${pkgdir}/usr/share/WonderLab/runtimes"
	install -Dm644 "../wonderlab.png" "${pkgdir}/usr/share/icons/wonderlab.png"
	install -Dm755 'WonderLab/bin/Release/net6.0/WonderLab' "$pkgdir/usr/local/bin/$_pkgname"
	install -Dm644 "../wonderlab.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	cd ..

}
