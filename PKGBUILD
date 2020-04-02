# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor-git
_pkgname=cpeditor
pkgver=20200402
pkgrel=1
pkgdesc='IDE desgined for Competitive Programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base')
makedepends=("clang" "cmake" "git")
conflicts=("cpeditor" "cpeditor-beta")
source=('git+https://github.com/cpeditor/cpeditor.git')
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	TZ=UTC date -d @$(git log -1 --format=%ct) +%Y%m%d
}

prepare() {
	cd $_pkgname
	git submodule update --init
}

build() {
	cd $_pkgname
	cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++
	cmake --build build
}

package() {
	cd $_pkgname/build
	make DESTDIR="$pkgdir" install
}



