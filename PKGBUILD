# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=nghttp3-git
pkgver=r152.34a21bf
pkgrel=1
pkgdesc="HTTP/3 library written in C"
arch=('x86_64')
url="https://github.com/ngtcp2/nghttp3"
license=('MIT')
makedepends=('git')
checkdepends=('cunit')
provides=('nghttp3' 'libnghttp3.so')
conflicts=('nghttp3')
source=('git+https://github.com/ngtcp2/nghttp3')
md5sums=('SKIP')

pkgver() {
  cd nghttp3

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nghttp3

  autoreconf -fisv

  ./configure \
      --prefix=/usr

  make
}

check() {
  cd nghttp3

  make -k check
}

package() {
  cd nghttp3

  make DESTDIR="$pkgdir" install
}
