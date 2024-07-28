# Maintainer: therisen06@gmail.com
_pkgbasename=river-ultitile
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=v1.1.1.r1.g2ba8531
pkgdesc="A layout generator for river"
arch=('x86_64' 'aarch64' 'i686')
url="https://git.sr.ht/~midgard/river-ultitile"
provides=('river-ultitile')
conflicts=('river-ultitile')
license=('GPL3')
depends=('zig' 'wayland' 'wayland-protocols')
makedepends=('git' 'pandoc')
source=(
    git+https://git.sr.ht/~midgard/river-ultitile
    0001-build-update-to-zig-0.13.patch)
sha256sums=(
    'SKIP'
    'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgbasename}"
    patch -Np1 -i "${srcdir}/0001-build-update-to-zig-0.13.patch"
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    install -D -m755 zig-out/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
