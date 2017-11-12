# Maintainer: hauzer <hauzer.nv@gmail.com>
pkgname=metashell
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc='A C++ metaprogramming shell.'
arch=('i686' 'x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL')
groups=()
depends=('readline' 'termcap')
makedepends=('cmake' 'clang')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('5b256847962492f366f1c71553533bb8')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p 'bin'
	mkdir -p '3rd/templight/build'
}

build() {
	pushd "$pkgname-$pkgver/3rd/templight/build"
	cmake ../llvm -DLIBCLANG_BUILD_STATIC=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_TERMINFO=OFF
	make clang libclang libclang_static templight
	popd
	
	cd "$pkgname-$pkgver/bin"
	cmake ..
	make
}

package() {
	cd "$pkgname-$pkgver/bin"
	make DESTDIR="$pkgdir/" install
}
