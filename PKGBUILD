pkgname=wofi-hg
pkgver=r112.7906ded22800
pkgrel=1
pkgdesc="Rofi-like wlroots launcher"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/wofi"
license=('GPL3')
depends=('wayland' 'gtk3')
makedepends=('mercurial' 'meson')
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
        cp ${pkgname}/build/wofi "$pkgdir/usr/bin/"
}