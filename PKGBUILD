# Maintainer: Federico Di Pierro <nierro92@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org

pkgname=libyder
_gitname=yder
pkgver=1.4.10
pkgrel=1
pkgdesc="Logging library for C applications"
arch=(x86_64)
url="https://github.com/babelouest/${_gitname}"
license=(GPL)
depends=('liborcania')
makedepends=('git' 'cmake')
source=("git+https://github.com/babelouest/yder.git#tag=v${pkgver}")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_gitname}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${_gitname}"
    cmake -B build \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
	-DWITH_JOURNALD=OFF
    make -C build
}

package() {
    cd "${srcdir}/${_gitname}"
    make -C build DESTDIR="$pkgdir" install
}
