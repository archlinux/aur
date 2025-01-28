# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.14
pkgrel=1
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL-3.0-or-later)
depends=(
    dconf
    cairo
    gdk-pixbuf2
    glib2
    graphene
    gtk4
    hicolor-icon-theme
    json-glib
    libadwaita
    "libipuz>=0.5.0"
    librsvg
    pango
    python-beautifulsoup4
    python-lxml
    python-puzpy
    python-regex
)
makedepends=(glib2-devel meson)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('073c80747e3b4a0dd156f086111ece0b19ab2e6e5174e4896c4724ae0b2a41ca')

build() {
    arch-meson ${pkgname}-${pkgver} build -Ddevelopment=false
    meson compile -C build
}

# requires creation of runtime dbus files, doesn't work in container / rua
check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
