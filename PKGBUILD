# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: eagletmt <eagletmt@gmail.com>
# Contributor: kaptoxic

pkgname=teyjus
pkgver=2.1.1
pkgrel=1
pkgdesc='An efficient implementation of the higher-order logic programming language λProlog'
url='http://teyjus.cs.umn.edu/'
arch=(i686 x86_64)
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(ocaml omake flex bison)
source=("https://github.com/teyjus/teyjus/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('a8fafe8ab7cd857a3f46ab8e4a7f76f9f3fac2169fdb72f95b84d1d0bcdf66f9')

prepare() {
    patch -p1 -d "$pkgname-$pkgver"  <../0001-Fix-build.patch
}

build() {
    make -C "$pkgname-$pkgver" all
}

check() {
    make -C "$pkgname-$pkgver" test
}

package() {
    cd "$pkgname-$pkgver"
    dune install --release --prefix="$pkgdir/usr"
}
