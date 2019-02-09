# Maintainer: Lin Ruoshui <echo bGluLnJ1b2hzaG9laUBnbWFpbC5jb20= | base64 -d>

pkgname=wavtool-pl
pkgver=r10.84ade75
pkgrel=1
pkgdesc="drop-in replacement for wavtool inside UTAU"
arch=('x86_64')
url="https://osdn.net/projects/wavtool-pl/"
license=('GPL3')
depends=('libsndfile')
makedepends=(git)
provides=('wavtool')
conflicts=('wavtool')
source=("$pkgname::git+https://scm.osdn.net/gitroot/wavtool-pl/wavtool-pl.git")
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
	cd "$pkgname"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	autoreconf -fi
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

