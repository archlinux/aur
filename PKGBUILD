# Maintainer: nyoravim <nora@bedafamily.com>

pkgname=libnyoravim-git
pkgver=1.0.3
pkgrel=4
pkgdesc="Personal C utility library."
arch=("any")
url="https://github.com/nyoravim/libnyoravim"
license=("Apache-2.0")
groups=()
depends=("glibc")
makedepends=("git" "base-devel" "clang" "cmake")
provides=("libnyoravim")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/nyoravim/libnyoravim.git#tag=${pkgver}")
noextract=()
sha256sums=("SKIP")

build() {
    cd "$srcdir/libnyoravim"

    cmake . -B build \
        -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DNV_BUILD_TESTS=OFF

    make -C build -j $(nproc)
}

package() {
    cd "$srcdir/libnyoravim"
    make -C build DESTDIR="$pkgdir/" install
}
