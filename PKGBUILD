# Maintainer: Alexandros Theodotou <alex at alextee dot org>

_pkgname=libcyaml
pkgname=$_pkgname-git
pkgver=master
pkgrel=1
pkgdesc="C library for reading and writing YAML"
arch=('x86_64')
url="https://git.zrythm.org/zrythm/libcyaml"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('libyaml')
makedepends=('git')
source=("$_pkgname::git+https://git.zrythm.org/zrythm/$_pkgname.git")
md5sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
}

build() {
	cd "$srcdir/$_pkgname"
  make
}

package() {
	cd "$srcdir/$_pkgname"
  mkdir -p $pkgdir/usr/lib/pkgconfig $pkgdir/usr/include
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
