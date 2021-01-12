# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libnsl-git
pkgver=1.3.0
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url='https://github.com/thkukuk/libnsl'
license=('LGPL2.1')
depends=(libtirpc)
provides=(libnsl)
conflicts=(libnsl)
source=("git+https://github.com/thkukuk/libnsl.git")
md5sums=('SKIP')

_commit() {
  # Convert HEAD into a shortened commit id:
  git rev-parse --short HEAD
}

pkgver() {
  cd libnsl

  # Suggestions for improvement welcome!
  printf '%s.r%s.%s'         \
  "$(_commit)"
}

prepare() {
  cd libnsl
}

build() {
  cd libnsl
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd libnsl
  make DESTDIR="$pkgdir" install
}
