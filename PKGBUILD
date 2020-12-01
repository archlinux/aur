# Maintainer: Songun Lee <leesongun@naver.com>

pkgname=wlhangul-git
_pkgname=wlhangul
pkgver=r6.9fbe8d7
pkgrel=1
pkgdesc="A Hangul input method for Wayland."
arch=('x86_64' 'i686')
url="https://github.com/emersion/wlhangul"
license=('MIT')
depends=('libhangul' 'wayland' 'libxkbcommon')
makedepends=('meson' 'git')
provides=('wlhangul')
source=('git+https://github.com/emersion/wlhangul.git')
sha256sums=('SKIP')
build() {
	cd "$srcdir"/"$_pkgname"
	meson build/
	ninja -C build/
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir"/usr/{bin,share,}
	install -Dm755 "build/$_pkgname" "$pkgdir"/usr/bin
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

