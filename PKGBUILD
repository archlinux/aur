# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=libmobi
pkgver=0.12
pkgrel=1
pkgdesc='Library for handling Kindle formats of ebook documents'
arch=('x86_64')
url='https://github.com/bfabiszewski/libmobi'
license=('LGPL-3.0-or-later')
depends=('libxml2' 'zlib')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('2b0c8e61e60d524bab6c1140188a3745c3542215918040b6d97a27db55637a49ef6ce0b4402d70c8d7c3d3f7ca6df2e971a0384bff31541089bc0343b39e4b3b')
b2sums=('489032cba7da8b10fb5829664350036f054c216f6abbae968681af978a66442b4a1d52beb3e9cc0acc9f8fd8c6581fb147d04f49774ad88c05e1191889c624b2')

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
