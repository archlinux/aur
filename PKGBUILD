# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=nifticlib
pkgver=3.0.0
pkgrel=1
pkgdesc='Collection of i/o routines for the nifti1 neuroimage data format'
arch=('x86_64')
url='https://github.com/NIFTI-Imaging/nifti_clib'
license=('custom:public domain')
depends=('zlib')
makedepends=('cmake' 'help2man')
source=("https://github.com/NIFTI-Imaging/nifti_clib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fe6cb1076974df01844f3f4dab1aa844953b3bc1d679126c652975158573d03d')

build() {
    cd "nifti_clib-$pkgver"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_FLAGS="$CFLAGS -fPIC" \
        -DBUILD_SHARED_LIBS=ON
    cmake --build build
}

package() {
    cd "nifti_clib-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
