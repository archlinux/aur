# Maintainer: Daurnimator <daurnimator@archlinux.org>
pkgname=azure-storage-fuse
pkgver=1.1.1
pkgrel=1
pkgdesc="A virtual file system adapter for Azure Blob storage"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-fuse"
license=('MIT')
depends=('boost-libs'
         'curl'
         'fuse'
         'gnutls'
         'libgcrypt')
makedepends=('boost'
             'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/azure-storage-fuse/archive/v$pkgver.tar.gz")
sha256sums=('a01b55681b1841947d82b516ef041e8b413aa93aa45728f6aa244d3ccc43c0ee')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  env -C build cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBoost_USE_STATIC_LIBS=OFF \
    ..
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
