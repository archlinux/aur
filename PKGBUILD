# Maintainer: Fred Mitchell <fred at atomlogik dot de>

pkgname=slit-scan
pkgver=0.1.0
pkgrel=1
pkgdesc="Streaming slit-scan animations from images, videos and a camera"
arch=('x86_64' 'aarch64')
url="https://github.com/flajann2/slit-scan-cpp"
license=('MIT')
depends=('gtkmm-4.0' 'opencv' 'yaml-cpp' 'libzip' 'ffmpeg' 'freetype2'
         'glibmm-2.68' 'libsigc++-3.0' 'gcc-libs' 'glibc')
# Arch's OpenCV CMake config references the VTK and HDF5 targets, so
# find_package(OpenCV) fails without them at build time.
makedepends=('cmake' 'ninja' 'vtk' 'hdf5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6c5fdd5eb81bc124fad11556a3f628061782605237b38662ce5699590228041')

build() {
  cmake -B build -S "$pkgname-cpp-$pkgver" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_PLAYGROUND=OFF \
    -DSLITSCAN_REGENERATE_UI=OFF \
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-cpp-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
