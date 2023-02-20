# Maintainer: Your Name <youremail@domain.com>
pkgname=zix-git
pkgver=r473.262d4a1
pkgrel=1
pkgdesc="A lightweight C library of portability wrappers and data structures"
arch=('any')
url="https://github.com/drobilla/zix"
license=('ISC')
depends=()
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson setup --prefix=/usr . build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
