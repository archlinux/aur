pkgname=wofi-hg
pkgver=r148.0522e8bc4ee9
pkgrel=1
pkgdesc="Rofi-like wlroots launcher"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/wofi"
license=('GPL3')
depends=('wayland' 'gtk3')
makedepends=('mercurial' 'meson')
conflicts=('wofi')
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
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/man/man5"
	mkdir -p "$pkgdir/usr/share/man/man7"
        cp ${pkgname}/build/wofi "$pkgdir/usr/bin/"
	cp ${pkgname}/man/wofi.1 "$pkgdir/usr/share/man/man1/"
	cp ${pkgname}/man/wofi.5 "$pkgdir/usr/share/man/man5/"
	cp ${pkgname}/man/wofi.7 "$pkgdir/usr/share/man/man7/"
}