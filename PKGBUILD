# Maintainer: pupu <li+puoopuo0o at nand dot sh>

pkgname=cskk
pkgver=3.3.0
pkgrel=1
pkgdesc="SKK (Simple Kana Kanji henkan) library"
arch=('x86_64')
url="https://github.com/naokiri/cskk"
license=('GPL-3.0-or-later')
depends=(
  glibc
  libgcc
  libxkbcommon
)
makedepends=(cargo-c)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b3264fda813f672eaf486b51d820f57cfdd5d8a401ac06e88ebbf47c74ff0f65d7cf3a9a64e7abb0ed51f47d9dbc287f9b65da920c292aecb2f6b2e840b9cf36')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --target host-tuple
}

build() {
  cd $pkgname-$pkgver
  cargo cbuild --frozen --release --prefix=/usr
}

check() {
  cd $pkgname-$pkgver
  cargo ctest --frozen --release
}

package() {
  cd $pkgname-$pkgver
  cargo cinstall --frozen --release --prefix=/usr --destdir="${pkgdir}"
}
