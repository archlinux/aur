# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Justine Smithies <justine AT smithies DOT me DOT uk>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: gilbus <aur(AT)tinkershell.eu>

pkgname=swayidle-git
pkgver=r118.61d653f
pkgrel=1
license=('MIT')
pkgdesc='Idle management daemon for Wayland (git development version)'
makedepends=(
    "git"
    "meson"
    "scdoc"
    "wayland-protocols"
    "glibc"
)
depends=(
    'wayland'
    'systemd-libs'
)
arch=('x86_64')
url="https://github.com/swaywm/swayidle"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/swaywm/swayidle.git")
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
