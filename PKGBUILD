# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocwmma
pkgver=5.2.1
pkgrel=1
pkgdesc='Library for accelerating mixed precision matrix multiplication'
arch=('x86_64')
url='https://rocwmma.readthedocs.io/en/latest/index.html'
license=('MIT')
depends=('hip' 'rocblas' 'openmp')
makedepends=('cmake' 'rocm-cmake' 'git' 'doxygen')
_git='https://github.com/ROCmSoftwarePlatform/rocWMMA'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('73adb6a0ae99051493459a9902ad718b0452d6d819583a58d713ce52fa813f21')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    cmake   -B build -Wno-dev \
            -S "$_dirname" \
            -DCMAKE_INSTALL_PREFIX=/opt/rocm \
            -DROCWMMA_BUILD_TESTS=OFF \
            -DROCWMMA_BUILD_SAMPLES=OFF
}

package() {
    DESTDIR="$pkgdir" make -C build install

    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
