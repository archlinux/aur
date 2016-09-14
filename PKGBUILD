# Maintainer: nyorain <nyorain at gmail dot com>
pkgname=nytl-git 
pkgver=v0.2.alpha
pkgrel=1
pkgdesc="C++17 header-only utility library"
arch=('any')
url="https://github.com/nyorain/nytl"
license=('MIT')
groups=()
depends=()
makedepends=('git') 
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/nyorain/nytl.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	rm -rf build && mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make -C build DESTDIR="$pkgdir/" install
}
