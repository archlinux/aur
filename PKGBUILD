# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=gcfuse-git
pkgver=0.9.1.r11.892e69e
pkgrel=1
pkgdesc="Mount Nintendo GameCube disc images using FUSE"
arch=('x86_64')
url="https://multimedia.cx/gcfuse/"
license=('GPL')
depends=('fuse2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/multimediamike/gcfuse.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  _ver_num="$(grep AC_INIT configure.ac | awk -F , '{ print $2; }' | tr -d ' []')"
  printf "%s.r%s.%s" "$_ver_num" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
