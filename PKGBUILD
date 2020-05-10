# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=taiga-hg
pkgver=1
pkgrel=1
pkgdesc="Animated screenshot program for wlroots compositors"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/taiga"
license=('GPL3')
depends=('wayland' 'ffmpeg')
makedepends=('mercurial' 'meson')
provides=('taiga')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
pkgver() {
        cd "$pkgname"
        printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
build() {
        cd "${pkgname}"
	meson build
	ninja -C build
}
package() {
        mkdir -p "$pkgdir/usr/bin"
        cp ${pkgname}/build/taiga "$pkgdir/usr/bin/"
}