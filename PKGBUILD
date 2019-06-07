# Maintainer: Ben Widawsky <ben@bwidawsk.net>
pkgname=kanshi-git
pkgver=r68.3100251
pkgrel=1
pkgdesc="Dynamic display configuration for WMs like i3/sway"
arch=(x86_64)
url="https://github.com/emersion/kanshi"
license=('MIT')
groups=()
depends=(wlroots-git)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('kanshi::git+https://github.com/emersion/kanshi.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	mkdir -p build
		meson build \
		--buildtype=release \
		--prefix=/usr
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" ninja -C build install

}
