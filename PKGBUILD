# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=opencl-icd-loader
pkgver=2025.07.22
pkgrel=1
pkgdesc="The OpenCL ICD Loader project."
arch=('x86_64')
url="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
license=('Apache-2.0')
depends=('glibc')
makedepends=(
  'cmake'
  'opencl-headers'
)
optdepends=('opencl-driver: packaged opencl driver')
provides=('libOpenCL.so=1' 'ocl-icd')
conflicts=('ocl-icd')
source=("OpenCL-ICD-Loader-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dff7a0b11ad5b63a669358e3476e3dc889a4a361674e5b69b267b944d0794142')

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
