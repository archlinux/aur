pkgname=constrict
pkgver=26.4
pkgrel=2
pkgdesc="Compress videos to target sizes"
url="https://gitlab.gnome.org/World/Constrict"
arch=(x86_64)
license=(GPL-3.0-or-later)
makedepends=(
    git
    meson
    blueprint-compiler
)
depends=(
    python
    python-cairo
    python-gobject
    gtk4
    glycin-gtk4
    libadwaita
    ffmpeg
)
optdepends=(
    'libva-utils: Hardware acceleration support'
)
source=("git+https://gitlab.gnome.org/World/Constrict.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Constrict build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
