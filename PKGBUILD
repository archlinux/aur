# Maintainer: saleh <salehjamaligolzar@gmail.com>
pkgname=docscan
pkgver=0.1.0
pkgrel=1
pkgdesc='Turn photos of documents into clean, straight PDF pages, like Microsoft Lens'
arch=('x86_64' 'aarch64')
url='https://github.com/salehjg/docscan'
license=('GPL-3.0-or-later')
depends=('opencv' 'texlive-basic' 'gcc-libs' 'glibc')
makedepends=('cmake' 'cli11')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d278f0251a22d2654babcb7f141d15165cd0b3a8f9d0165800752b63b64a63c3')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cmake -B build -S "$pkgname-$pkgver" -DDOCSCAN_BUILD_TESTS=ON
  cmake --build build
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
