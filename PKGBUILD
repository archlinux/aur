# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=opencl-icd-loader
pkgver=2024.10.24
pkgrel=1
pkgdesc="The OpenCL ICD Loader project."
arch=('x86_64')
url="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake' 'opencl-headers')
optdepends=('opencl-driver: packaged opencl driver')
provides=('libOpenCL.so=1' 'ocl-icd')
conflicts=('ocl-icd')
source=("OpenCL-ICD-Loader-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc')

build() {
  cmake -B build -S "OpenCL-ICD-Loader-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
