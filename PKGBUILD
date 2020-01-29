# Maintainer: Greg Erwin <first name last name 256 at gmail dot com>

pkgname=libgpiod
pkgver=1.4.2
pkgrel=1
pkgdesc="C library and tools for interacting with the linux GPIO character device"
url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
depends=('linux>=4.8' 'python')
makedepends=('autoconf-archive' 'help2man')
conflicts=('libgpiod-git')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('e0ccad3c0cddf5660e07e9cc324a5c18e8d8caa362c23ad40ef11adf6c6c1064')

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
