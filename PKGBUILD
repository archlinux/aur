# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=opencl-icd-loader
pkgver=2026.05.29
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
sha256sums=('48fd0c5181db7cd046f4f731d5955694892e10998d49d09ee0d997e7e04fd939')

build() {
  cmake -B build -S "OpenCL-ICD-Loader-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-author
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
