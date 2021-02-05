# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=kpack-git
_pkgname=kpack
pkgver=1.1.0.r2.gec7620f
pkgrel=2
license=('MIT')
pkgdesc='Manipulates KnightOS software packages'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kpack'
source=("$pkgname::git+https://github.com/KnightOS/${_pkgname}.git")
sha256sums=('SKIP')
provides=('kpack')
conflicts=('kpack')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$pkgname"
    CFLAGS+=" -w"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
