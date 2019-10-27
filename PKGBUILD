# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako-git
_pkgname=mako
pkgver=r430.bf6d462
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
source=("${pkgname%-*}::git+https://github.com/emersion/mako.git")
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
