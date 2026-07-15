# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.18.1
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
    "libipuz>=0.5.4"
    librsvg
    pango
    python-beautifulsoup4
    python-lxml
    python-puzpy
    python-regex
)
makedepends=(glib2-devel meson blueprint-compiler)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('493623de5aa3c4ee1a465ae41ffd389d365f72af87afcd0e2ef66a90d45a76e9')

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
