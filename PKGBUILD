# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

_name=Komikku
pkgname=komikku-git
pkgver=1.101.0.r12.g1c02cc76
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME with PinePhone and Librem 5 Support'
arch=(any)
url=https://apps.gnome.org/Komikku/
license=(GPL-3.0-or-later)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  graphene
  gtk4
  hicolor-icon-theme
  libadwaita
  libsoup3
  pango
  python
  python-beautifulsoup4
  python-brotli
  python-colorthief
  python-cryptography
  python-dateparser
  python-emoji
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-natsort
  python-piexif
  python-pillow
  python-pyjwt
  python-pypdf
  python-pytz
  python-rarfile
  python-requests
  python-tzlocal
  python-unidecode
  python-urllib3
  webkitgtk-6.0
)
makedepends=(
  appstream
  blueprint-compiler
  git
  meson
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+https://codeberg.org/valos/Komikku.git)
b2sums=('SKIP')

pkgver() {
  cd ${_name}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_name} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  meson install -C build --destdir "$pkgdir"
}
