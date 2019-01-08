# Maintainer: Alexandros Theodotou <alex at alextee dot org>

pkgname=zrythm-git
pkgver=r141.668d754
pkgrel=1
pkgdesc="Free GNU/Linux music production system (DAW)"
arch=('x86_64')
url="https://gitlab.com/alextee/zrythm"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gtk3' 'lv2' 'lilv' 'suil' 'jack' 'libsndfile' 'libsmf' 'libdazzle')
makedepends=('git')
source=("$pkgname::git+https://gitlab.com/alextee/zrythm.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -fi
	./configure --prefix=/usr --enable-aur-build
	make
}

package() {
  cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}

