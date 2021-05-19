# Maintainer: Senan Kelly <senan@senan.xyz>

pkgname=wlr-sunclock-git
_pkgname=wlr-sunclock
pkgver=r33.bf2d38f
pkgrel=1
pkgdesc='Displays a sunclock desktop widget using the layer shell protocol'
arch=(x86_64)
url='https://github.com/sentriz/wlr-sunclock'
license=('LGPL3')
groups=()
depends=('gtk3' 'gobject-introspection' 'gtk-layer-shell')
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
	meson --prefix /usr "$srcdir/build"
	ninja -C "$srcdir/build"
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
