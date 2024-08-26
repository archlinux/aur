# Maintainer: Heddxh <g311571057 at gmail dot com>
pkgname=apostrophe
pkgver=3.1
pkgrel=1
pkgdesc="A distraction free Markdown editor"
arch=(x86_64)
url="https://gitlab.gnome.org/World/apostrophe"
license=('GPL-3.0-only')
groups=()
depends=(
    gtk4
    glib2
    python
    #python-regex
    #python-setuptools
    #python-levenshtein
    python-gobject
    #python-cairo
    python-pypandoc
    python-chardet
    libadwaita
    webkitgtk-6.0
    libspelling-apostrophe
    gtksourceview5-apostrophe
    dconf
    pango
    gdk-pixbuf2
    graphene
    hicolor-icon-theme
)
makedepends=(meson git)
optdepends=(
    texlive
    texlive-latex
    pandoc
    python-pyenchant
)
checkdepends=(appstream-glib)
provides=()
conflicts=()
source=(
    "git+https://gitlab.gnome.org/World/$pkgname.git#tag=v$pkgver"
    #"reveal.js.tar.gz::https://api.github.com/repos/hakimel/reveal.js/tarball/5.1.0"
)
sha256sums=('02a5d8832ab3d426dfb6f87f32d5f99ddfdd8ac5c428ff747c51e056b58e5dc8')

prepare() {
    cd "$pkgname"
    sed '/reveal/{N;N;N;d}' --in-place meson.build # Remove reveal.js checking
}

build() {
    arch-meson $pkgname build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
    #cp -r reveal.js "$pkgdir/usr/share/$pkgname/libs"
}
