# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Primalmotion <primalmotion@pm.me>
# Contributor: gilbus <aur@tinkershell.eu>

pkgname=swaylock-git
pkgver=r317.91bb968
pkgrel=1
pkgdesc='Screen locker for Wayland (git development version)'
url='https://github.com/swaywm/swaylock'
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('x86_64')
depends=(
    "cairo"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "pam"
    "wayland"
    "libxkbcommon"
)
makedepends=(
    "git"
    "meson"
    "scdoc"
    "wayland-protocols"
)
backup=('etc/pam.d/swaylock')
source=("${pkgname}::git+https://github.com/swaywm/swaylock.git")
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
