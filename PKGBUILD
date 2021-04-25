# Maintainer: Artemy Fedotov <catlovescpp@gmail.com>

_pkgname=wlanthy
pkgname=${_pkgname}-git
pkgver=r44.19ccdb7
pkgrel=1
pkgdesc="Experimental, simple Wayland-native Japanese input method"
arch=('any')
url="https://github.com/st3r4g/wlanthy"
license=('MIT')
depends=('anthy' 'wayland' 'libxkbcommon')
makedepends=('meson' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/st3r4g/wlanthy.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/"$_pkgname"
	meson build
	ninja -C build
}

package() {
	cd "$srcdir"/"$_pkgname"
	install -Dm755 "build/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
