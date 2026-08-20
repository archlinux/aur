# Maintainer: symb0l <symb0l@proton.me>
# Release package: builds from a tagged source tarball. For the VCS package see PKGBUILD-git.
pkgname=arcane-launcher
pkgver=0.8.2
pkgrel=1
pkgdesc="Open-source, self-contained Battle.net launcher for World of Warcraft (no Battle.net client)"
arch=('x86_64')
url="https://codeberg.org/symb0l/arcane-launcher"
license=('GPL-3.0-or-later')
depends=('qt6-webengine' 'qt6-base' 'protobuf' 'curl' 'openssl' 'libzip' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'mingw-w64-gcc')
optdepends=('umu-launcher: launch games under Proton (recommended backend)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('07d91a0bff0f2af0c9ce8bfc8b89b6fcdff17f68115bc4702c5f5a7a3a3a1452')

build() {
    cmake -S "$srcdir/$pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DARCANE_BUILD_QT=ON \
        -DARCANE_BUILD_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
