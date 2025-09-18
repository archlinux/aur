# Maintainer: bash-ful <bash-ful0931 at proton dot me>
pkgname=shaderbg-git
pkgver=r8.027d4f8
pkgrel=1
pkgdesc="A live wallpaper program for Sway and other compositors with wlr-layer-shell support"
arch=('x86_64')
url="https://sr.ht/~mstoeckl/shaderbg"
license=('GPL-3.0-or-later')
depends=('glibc' 'libglvnd' 'wayland')
makedepends=('git' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!debug')
source=('git+https://git.sr.ht/~mstoeckl/shaderbg')
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	meson setup --prefix=/usr --buildtype=plain "${pkgname%-git}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
