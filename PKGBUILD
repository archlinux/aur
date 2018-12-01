# Maintainer: Greg Erwin <first name last name 256 at gmail dot com>

pkgname=libgpiod
pkgver=1.2
pkgrel=1
pkgdesc="C library and tools for interacting with the linux GPIO character device"
url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
depends=('linux>=4.8')
makedepends=(autoconf-archive)
conflicts=('libgpiod-git')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('0e26acb2294e55001fd30cc194a7a1ace9bc7211231a8b8c88112ca51f71f647')

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
  make DESTDIR="$pkgdir/" install
}
