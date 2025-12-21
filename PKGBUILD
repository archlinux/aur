pkgname=tomo
tomover=2025-12-21
pkgver="${tomover//-/.}"
pkgrel=1
pkgdesc='The Tomo programming language compiler'
arch=('x86_64')
url="https://tomo.bruce-hill.com"
license=('custom')
depends=('gcc' 'binutils' 'gmp' 'libunistring' 'gc')
makedepends=('git' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bruce-hill/tomo/archive/refs/tags/v$tomover.tar.gz")
sha256sums=('b55f1df28952e165ccbcc92a71c9f6666144e3cd8de472013ac3d319d14ea4b0')

build() {
  cd "tomo-$tomover"
  cat <<END >config.mk
PREFIX=$pkgdir
DEFAULT_C_COMPILER=gcc
SUDO=sudo
END
  PATH="$pkgdir/bin:$PATH" make -j
}

package() {
  cd "tomo-$tomover"
  PATH="$pkgdir/bin:$PATH" make -j install
}
