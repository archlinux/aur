# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.11
pkgrel=1
pkgdesc='Library for handling Kindle formats of ebook documents'
arch=('x86_64')
url='https://github.com/bfabiszewski/libmobi'
license=('LGPL3')
depends=('libxml2' 'zlib')
makedepends=('git')
_commit='864e3a86f2565b650f203ec6b1fddc4fb16df925'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  ./autogen.sh
}

build() {
  cd "$pkgname"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --with-libxml2 \
    --with-zlib

  make
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
