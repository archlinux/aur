# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor: Ilya Terentyev <bacondropped at gmail dot com>
pkgname=lolremez-git
pkgver=0.7.r31.g23e063c
pkgrel=1
pkgdesc="Polynomial Approximations using the Remez Algorithm by Sam Hocevar"
arch=("i686" "x86_64")
url="https://github.com/samhocevar/lolremez"
license=("WTFPL")
makedepends=("git" "autoconf" "automake")
depends=()
conflicts=()
source=("lolremez::git+https://github.com/samhocevar/lolremez")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/lolremez"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
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
