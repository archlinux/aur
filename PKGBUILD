# Maintainer: pupu <li+puoopuo0o at nand dot sh>

pkgname=cskk
pkgver=4.0.0
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
b2sums=('2257a1455982fc80f4344db82cb8a1ffc3fafa5091cb2555a4ebed585bbd035530121cc292ff2c55a98f169545d0e72d592e64d905d14c7ad99e20f1ece8dc42')

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
