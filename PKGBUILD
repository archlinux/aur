# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Taran Lynn <taranlynn0gmail.com>

pkgname=swaybg-git
pkgver=r130.eabc06e
pkgrel=1
license=("MIT")
pkgdesc="Wallpaper tool for Wayland compositors (git development version)"
makedepends=(
    'meson'
    "git"
    "scdoc"
    "wayland-protocols"
)
depends=(
    "cairo"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "wayland"
)
arch=('x86_64')
url="https://github.com/swaywm/swaybg"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/swaywm/swaybg.git")
b2sums=('SKIP')

pkgver() {
    # Calculate the version dynamically using git information
    printf "r%s.%s" "$(git -C "$srcdir/${pkgname}" rev-list --count HEAD)" "$(git -C "$srcdir/${pkgname}" rev-parse --short HEAD)"
}

build() {
    arch-meson build "${pkgname}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -Dm644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
