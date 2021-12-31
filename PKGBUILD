# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname='yah'
pkgver=0.4.2
pkgrel=1
epoch=2
pkgdesc='Yes, another AUR helper'
arch=('x86_64')
url="https://github.com/Bultek/yah"
license=('AGPLv3')
makedepends=('dotnet-sdk-6.0' 'bash')
depends=('sudo' 'bash' 'git')
source=('Program.cs' 'yahcd.sh' 'yahmkpkg.sh' 'yah.csproj' 'dotpublish.sh')
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
prepare() {
	sudo rm -rf /usr/bin/yah
	sudo rm -rf bin
	sudo rm -rf build
	sudo rm -rf obj
	sudo rm -rf /usr/bin/yahmkpkg.sh
	sudo rm -rf /usr/bin/yahcd.sg
	sudo mkdir build
}

build() {
	sudo bash ./dotpublish.sh yah.csproj build
}
package() {
	sudo cp yahcd.sh $pkgdir
	sudo cp yahmkpkg.sh $pkgdir
	cd build
	sudo chmod +x yah
	sudo cp yah $pkgdir
	sudo ln -s $pkgdir/yah /usr/bin
}
