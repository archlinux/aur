# Maintainer: Joseph Mellor <the.landfill.coding@gmail.com>
pkgname=md++-git
pkgver=0.9
pkgrel=1
epoch=
pkgdesc="A fast, extensible, and easy to use static site generator. Still in alpha."
arch=(any)
url="https://github.com/TheLandfill/mdxx.git"
license=('GPL3')
groups=()
depends=(glibc gcc-libs python)
makedepends=(git cmake make)
checkdepends=()
optdepends=()
provides=(md++)
options=()
install=
changelog=
noextract=()
source=("git+$url")
md5sums=('SKIP')
validpgpkeys=()

build() {
	mkdir -p "mdxx/md++/build/"
	cd "mdxx/md++/build/"
	git submodule init
	git submodule update
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../bin/gcc-linux/toolchain.cmake ..
	make -j install
}

package() {
	cd "mdxx/md++/build/out/"
	mkdir -p ${pkgdir}/usr/lib/${pkgname}
	mkdir -p ${pkgdir}/usr/bin/
	cp mdxx ${pkgdir}/usr/bin/md++
	cp -rf plugins/ lib/ ${pkgdir}/usr/lib/${pkgname}
	install -Dm644 ../../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
