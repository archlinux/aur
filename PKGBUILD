# Maintainer: Nikolai Nechaev <nikolay_nechaev@mail.ru>
# Contributor: Songun Lee <leesongun@naver.com>

pkgname=wlhangul-git
_pkgname=wlhangul
pkgver=r14.ae94745
pkgrel=1
pkgdesc="A Hangul input method for Wayland."
arch=('x86_64' 'i686')
url="https://gitlab.freedesktop.org/emersion/wlhangul"
license=('MIT')
depends=('libhangul' 'wayland' 'libxkbcommon')
makedepends=('meson' 'git' 'wayland-protocols')
provides=('wlhangul')
source=('git+https://gitlab.freedesktop.org/emersion/wlhangul.git')
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

