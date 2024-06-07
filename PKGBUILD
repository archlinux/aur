# Maintainer:
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=g4music
pkgver=3.6.2
pkgrel=1
pkgdesc="Play your music elegantly"
arch=('aarch64' 'x86_64')
url="https://gitlab.gnome.org/neithern/g4music"
license=('GPL-3.0-or-later')
depends=('dconf'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'graphene'
         'gst-plugins-base-libs'
         'gstreamer'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'pango')
makedepends=('meson' 'vala')
optdepends=('gst-plugins-bad: "bad" plugin libraries'
            'gst-plugins-base: "base" plugin libraries'
            'gst-plugins-good: "good" plugin libraries'
            'gst-plugins-ugly: "ugly" plugin libraries')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('3f3d86b5d312fd273d4adbc77d74538a78dcae505004dc1fc2d5faa0e306c901034ba4135ca6b289124b0e2d5290372dd160041652beff0ff7a70b43df259f70')

build() {
  arch-meson "${pkgname}-v${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
