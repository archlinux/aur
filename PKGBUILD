# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=1.17.0
commitnum=97162e033dcef7d2ecdd9da7465cc27e8e1f9858
pkgrel=1
pkgdesc='Online/Offline Manga reader based on GNOME | PinePhone/Librem 5 Support'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  libadwaita
  python-beautifulsoup4
  python-brotli
  python-cairo
  python-cffi
  python-cloudscraper
  python-dateparser
  python-emoji
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-natsort
  python-pillow
  python-piexif
  python-pure-protobuf
  python-unidecode
  python-wheel
  python-rarfile
  webkit2gtk
  webkit2gtk-5.0
)
makedepends=(
  gobject-introspection
  meson
)
optdepends=('org.freedesktop.secrets: store passwords safely')
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz")
sha256sums=('76fafad31480dde10bf75969870d212337618be242919f53c28661bef949647e')

#Build has a janky fix; Git clone didn't clone into v1.17.0 but its commitnum
build() {
  arch-meson $_gitname-$commitnum build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
