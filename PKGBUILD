pkgname=turntable-git
pkgver=0.3.3.r157.g05e9d9c
pkgrel=1
pkgdesc="Scrobble your music to Last.fm, ListenBrainz, Libre.fm and Maloja (latest git version)"
arch=('x86_64' 'aarch64')
url="https://turntable.geopjr.dev/"
license=('GPL3')

depends=('glib2' 'gtk4' 'libadwaita' 'gdk-pixbuf2' 'pango' 'json-glib' 'libsecret' 'libsoup3' 'graphene'  'glycin-gtk4')
makedepends=(
  'base-devel' 'meson' 'vala' 'gettext' 'desktop-file-utils'
  'libxml2' 'appstream-glib'
  'glib2' 'gtk4' 'libadwaita' 'json-glib' 'libsecret' 'libsoup3'
  'pango' 'gdk-pixbuf2' 'graphene' 'glycin-gtk4'
)

source=("$pkgname::git+https://github.com/GeopJr/Turntable.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/turntable-git"
  printf "0.3.3.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/turntable-git"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/turntable-git"
  DESTDIR="$pkgdir" meson install -C build
}
