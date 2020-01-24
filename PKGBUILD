# Maintainer: Jason Nader <jason.nader@protonmail.com>
pkgname=wlogout-git
_pkgname=wlogout
pkgver=r60.7d7fc8b
pkgrel=1
license=("MIT")
pkgdesc="Logout menu for wayland"
makedepends=("meson" "git" "scdoc" "ninja")
depends=("gtk3" "gobject-introspection")
optdepends=(
	"swaylock: default buttons"
	"systemd: default buttons"
)
arch=("x86_64")
url="https://github.com/ArtsyMacaw/wlogout.git"
source=("${pkgname%-*}::git+https://github.com/ArtsyMacaw/wlogout.git")
sha512sums=('SKIP')
provides=("wlogout")
conflicts=("wlogout")
options=(debug !strip)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	meson \
		-Dwerror=false \
		--prefix /usr \
		"$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
