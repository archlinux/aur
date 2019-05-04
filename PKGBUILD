# Maintainer: Taran Lynn <taranlynn0gmail.com>
pkgname=swaybg-git
_pkgname=swaybg
pkgver=r94.25c6eaf
pkgrel=1
license=("MIT")
pkgdesc="Wallpaper tool for Wayland compositors"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
    "wayland" "cairo"
)
optdepends=(
    "gdk-pixbuf2: For background images other than PNG"
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/swaybg.git#branch=master")
sha1sums=("SKIP")
provides=("swaybg")
conflicts=("swaybg")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ninja -C "$srcdir/build"
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
