# Maintainer: Wesley Chan https://aur.archlinux.org/account/Wesley_Chan
# Maintainer: Zhirui Dai https://aur.archlinux.org/account/daizhirui
# Original authors: Sven-Hendrik Haase <sh@lutzhaase.com>, Markus Martin <markus@archwyrm.net>

pkgname=nvtx3
pkgver=3.2.1
pkgrel=1
pkgdesc="NVIDIA Tools Extension (NVTX) library for C++ applications"
url="https://github.com/NVIDIA/NVTX.git"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
conflicts=()
provides=("nvtx3")
makedepends=('cmake' 'git')
source=(${pkgname}::git+https://github.com/NVIDIA/NVTX.git#tag=v${pkgver})
md5sums=('SKIP')

# pkgver() {
#   cd $pkgname
#   git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd $srcdir
    cmake -B build -S $pkgname -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
    cmake --build build -- -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
