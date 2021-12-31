# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname='yah'
pkgver=0.1.3
pkgrel=1
epoch=1
pkgdesc='Yes, another AUR helper'
arch=('x86_64')
url="https://github.com/Bultek/yah"
license=('AGPLv3')
makedepends=('dotnet-sdk-6.0' 'sudo')
depends=('runasunified' 'dotnet-runtime-6.0' 'bash' 'git')
source=('Program.cs' 'yahcd.sh' 'yahmkpkg.sh' 'yah.csproj')
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
prepare() {
	sudo rm -rf $pkgdir/ref/yah.dll
	sudo rm -rf $pkgdir/yah.dll
	sudo rm -rf /usr/bin/yah
}

build() {
	dotnet build
}
package() {
	sudo cp yahcd.sh $pkgdir
	sudo cp yahmkpkg.sh $pkgdir
	cd bin/Debug/net6.0
	sudo chmod +x yah
	sudo cp yah $pkgdir
	sudo cp yah.dll $pkgdir
	sudo cp yah.deps.json $pkgdir
	sudo cp yah.runtimeconfig.json $pkgdir
    sudo ln -s $pkgdir/yah /usr/bin
}
