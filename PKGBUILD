# Maintainer: Eike <e.g@wwu.de>
pkgname=openeb-git
_pkgname=openeb
pkgdesc="Open source SDK for event based cameras by Prophesee"
pkgver=r91.09c57ca
pkgrel=1
arch=('any')
license=(custom)
url="https://github.com/prophesee-ai/openeb"
depends=(opencv boost eigen libusb glew glfw hdf5 ffmpeg openscenegraph libcanberra)
optdepends=('cuda: machine learning samples')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/prophesee-ai/openeb")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${_pkgname}" \
		-DBUILD_TESTING=off \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
