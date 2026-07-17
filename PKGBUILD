# Maintainer: Seraphim Pardee <me at srp dot life>

pkgname=rlshim-git
pkgver=1.3.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite. (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'openssl' 'glfw' 'glibc' 'java-runtime>=11')
makedepends=('cmake' 'clang' 'git' 'make' 'pkgconf' 'curl' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr')
provides=('rlshim')
conflicts=('rlshim')
source=("git+https://github.com/RdrSeraphim/rlshim.git")
sha256sums=('SKIP')

pkgver() {
  cd rlshim
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd rlshim
    CXX=clang++ CC=clang cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd rlshim
    DESTDIR="$pkgdir" cmake --install build
}
