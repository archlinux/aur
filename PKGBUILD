# Maintainer:  Ilya Terentyev <bacondropped at gmail dot com>
pkgname=lolremez-git
pkgver=0.3.r5.g5ff460f
pkgrel=2
pkgdesc="Polynomial Approximations using the Remez Algorithm by Sam Hocevar"
arch=("i686" "x86_64")
url="https://github.com/samhocevar/lolremez"
license=("unknown")
makedepends=("git" "autoconf" "automake")
depends=()
conflicts=()
source=(
  "lolremez::git+https://github.com/samhocevar/lolremez"
  "v0.3-submodule-abs-url.patch")
sha1sums=(
  "SKIP"
  "90d5b8250bb957347dfb46a34b85c1e383b62cd2")

pkgver() {
  cd "$srcdir/lolremez"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "$srcdir/lolremez"

  patch -Np1 < "$srcdir/v0.3-submodule-abs-url.patch"
}

build() {
  cd "$srcdir/lolremez"

  git submodule update --init --recursive
  ./bootstrap

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/lolremez"
  make DESTDIR="$pkgdir/" install
}
