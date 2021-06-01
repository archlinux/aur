# Maintainer: Ícar N. S. <icar.nin@protonmail.com>

_pkgname=fractal
pkgname=fractal-next
pkgver=r122.145e9bd0
pkgrel=1
pkgdesc="GTK4 client for Matrix written in Rust (fractal-next branch)"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Fractal"
license=(GPL3)
depends=(gtk4 gst-plugins-base-libs gst-plugin-gtk gst-plugins-bad gst-editing-services gtksourceview5 gspell libhandy)
optdepends=('org.freedesktop.secrets: password storage')
makedepends=(meson rust)
source=("fractal::git+https://gitlab.gnome.org/GNOME/fractal#branch=fractal-next")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd ${_pkgname}
    arch-meson . _build
    meson compile -C _build
}

package() {
    cd ${_pkgname}
    DESTDIR="${_pkgdir}" meson install -C _build
}
