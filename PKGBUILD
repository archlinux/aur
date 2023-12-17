# Maintainer: GuyLiner <guyliner69@proton.me>
_pkgname='i3bar-river'
pkgname=${_pkgname}-git
pkgver=r152.663c70c
pkgrel=1
pkgdesc="A port of i3bar for the river Wayland compositor"
url="https://github.com/MaxVerevkin/i3bar-river"
arch=('x86_64')
license=('GPL3')
depends=(cairo pango)
makedepends=(git cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://github.com/MaxVerevkin/i3bar-river.git')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable 
    cargo install --no-track --all-features --locked --root "$pkgdir/usr/" --path .
}
