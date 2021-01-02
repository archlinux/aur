# Maintainer: bin <bin at datacowboy dot cf>
pkgname="ktx_software-git"
_pkgname="ktx_software"
pkgver=4.0.0.beta5.r3.g67a11a84
pkgrel=1
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/KhronosGroup/KTX-Software"
license=("Apache")
depends=("zstd")
makedepends=("clang"
	     "cmake")
provides=("ktx_software")
conflicts=("ktx_software")
source=("KTX-Software::git+https://github.com/KhronosGroup/KTX-Software#branch=master")
sha256sums=("SKIP")

reponame="KTX-Software"
builddir="build"

pkgver() {
	cd "$srcdir/$reponame"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "$srcdir/$reponame/$builddir"
}

build() {
	cd "$srcdir/$reponame/$builddir"
	cmake .. -DKTX_FEATURE_DOC=OFF -DKTX_FEATURE_LOADTEST=OFF -DKTX_FEATURE_STATIC_LIBRARY=ON -DKTX_FEATURE_TESTS=OFF -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release
	cmake --build . --config Release
}

package() {
	cd "$srcdir/$reponame/$builddir"
	cmake --install . --prefix ${pkgdir}/usr
}
