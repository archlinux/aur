# Maintainer: Senan Kelly <senan@senan.xyz>

pkgname=wlr-sunclock-git
_pkgname=wlr-sunclock
pkgver=r48.8d5a6c1
pkgrel=2
pkgdesc='Displays a sunclock desktop widget using the layer shell protocol'
arch=(x86_64)
url='https://github.com/sentriz/wlr-sunclock'
license=('LGPL3')
groups=()
depends=('gtk4' 'gtk4-layer-shell' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=('wlr-sunclock::git+https://github.com/sentriz/wlr-sunclock.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	meson setup --prefix /usr build
	ninja -C build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C build install
}
