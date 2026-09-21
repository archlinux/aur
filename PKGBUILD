# Maintainer: Seraphim Pardee <me at srp dot life>

pkgname=rlshim
pkgver=1.4.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite."
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'openssl' 'glfw' 'glibc' 'java-runtime>=11')
makedepends=('cmake' 'clang' 'make' 'pkgconf' 'curl' 'git' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr')
provides=('rlshim')
conflicts=('rlshim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RdrSeraphim/rlshim/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('179462375ec81fdb0754cbdb9ced61677a17184637216a0e219c624f002aae00')

build() {
    cd "$pkgname-$pkgver"
    CXX=clang++ CC=clang cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
