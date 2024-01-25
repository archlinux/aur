# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=gpu-stress-test-git
_pkgname=GPUStressTest
pkgver=r57.1d275b9
pkgrel=2
pkgdesc="GPU Stress Test is a tool to stress the compute engine of NVIDIA Tesla GPU’s by running a BLAS matrix multiply using different data types"
arch=(x86_64)
url="https://github.com/NVIDIA/GPUStressTest"
license=('GPL')
depends=(cuda)
makedepends=(
    "git"
    "cmake"
    "gcc12"
)
checkdepends=()
provides=(gpu-stress-test)
conflicts=(gpu-stress-test)
source=("git+https://github.com/NVIDIA/GPUStressTest.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -S "$_pkgname"
    )

    export CC=gcc-12
    export CXX=g++-12

    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    install -Dm755 build/gst "$pkgdir/usr/bin/gst"
}
