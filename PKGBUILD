# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname='yah'
pkgver=0.4.3
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
	sudo rm -rf /usr/bin/yahcd.sh
	sudo mkdir ${srcdir}/build
}

build() {
	sudo bash ${srcdir}/dotpublish.sh ${srcdir}/yah.csproj ${srcdir}/build
}
package() {
	cd ${srcdir}
	sudo chmod +x "${srcdir}/yahcd.sh"
	sudo chmod +x "${srcdir}/yahmkpkg.sh"
	sudo mkdir -p "${pkgdir}/usr/bin"
	sudo cp "${srcdir}/yahcd.sh" "${pkgdir}/usr/bin/yahcd.sh"
	sudo cp "${srcdir}/yahmkpkg.sh" "${pkgdir}/usr/bin/yahmkpkg.sh"
	cd "${srcdir}/build"
	sudo chmod +x "${srcdir}/build/yah"
	sudo cp "${srcdir}/build/yah" "${pkgdir}/usr/bin/yah"
}
