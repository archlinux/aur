pkgname=rootbar-hg
pkgver=r98.63ee1eed0bfc
pkgrel=1
pkgdesc="Status bar for the Sway Compositor"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/rootbar"
license=('GPL3')
depends=('wayland' 'gtk3' 'json-c' 'libpulse')
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
        cp ${pkgname}/build/rootbar "$pkgdir/usr/bin/"
}