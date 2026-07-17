# Maintainer: Seraphim Pardee <me at srp dot life>

pkgname=rlshim
pkgver=1.3.0
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
sha256sums=('62a8f318cb893cc872d415ccc5c5e78a0bed0351a1ee2240c1b29cc91446a7b9')

build() {
    cd "$pkgname-$pkgver"
    CXX=clang++ CC=clang cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}
