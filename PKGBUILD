# Maintainer: Rhys Perry <rhysperry111 AT gmail DOT com>
# Based off of: mako-git
pkgname=mako-animated-git
_pkgname=mako-animated
pkgver=devel
pkgrel=1
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc" "wayland-protocols" "git")
depends=(
	"pango"
	"cairo"
	"wayland"
)
optdepends=("jq: support for 'makoctl menu'")
arch=("x86_64")
url='http://mako-project.org'
source=("${pkgname%-*}::git+https://github.com/rhysperry111/mako-animated.git")
sha1sums=('SKIP')
provides=('mako')
conflicts=('mako')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir/" ninja -C build install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
