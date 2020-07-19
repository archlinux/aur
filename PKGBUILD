# Maintainer: Greg Erwin <first name last name 256 at gmail dot com>

pkgname=libgpiod
pkgver=1.5.1
pkgrel=1
pkgdesc="C library and tools for interacting with the linux GPIO character device"
url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
depends=('linux-api-headers>=5.5' 'python')
makedepends=('autoconf-archive' 'help2man')
conflicts=('libgpiod-git')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('85ef3d1225e340a3ddd8c8ca5bdf006b3722a05ce1e3095df4f6bbed79443b92')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh \
    --prefix=/usr \
    --enable-tools=yes \
    --enable-bindings-cxx \
    --enable-bindings-python
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
