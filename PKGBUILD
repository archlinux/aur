# Maintainer: Kimiblock Moe

pkgname=thirdroom-git
pkgver=r2923.01bc731b
pkgrel=1
pkgdesc="Open, decentralised, immersive worlds built on Matrix"
arch=('any')
url="https://github.com/matrix-org/thirdroom"
license=('Apache-2.0')
depends=()
makedepends=("git" "yarn")
provides=("thirdroom")
source=('git+https://github.com/matrix-org/thirdroom.git')
sha256sums=('SKIP')
conflicts=("thirdroom")

function prepare() {
	cd thirdroom
	yarn install
}

function pkgver(){
	cd thirdroom
	#git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build(){
	cd thirdroom
	yarn run build
}

function package(){
	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/thirdroom/dist" "${pkgdir}/usr/share/thirdroom"
	chmod -R 755 "${pkgdir}/usr/share/thirdroom"
}

