# Maintainer: nyorain <nyorain at gmail dot com>
pkgname=nytl-git
pkgver=v0.5.r9.0916d47
pkgrel=1
pkgdesc="C++17 header-only utility library"
arch=('any')
url="https://github.com/nyorain/nytl"
license=('Boost')
groups=()
depends=()
makedepends=('git' 'meson' 'gcc' 'ninja')
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
	rm -rf build
	meson --prefix=/usr build
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	ninja
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	DESTDIR="$pkgdir" ninja -C build install
}
