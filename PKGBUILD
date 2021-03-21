# Maintainer: Mufeed Ali <fushinari@protonmail.com>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.27.0
pkgrel=3
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  gtk3
  libhandy
  python
  python-beautifulsoup4
  python-brotli
  python-cairo
  python-cffi
  python-dateparser
  python-gobject
  python-keyring
  python-lxml
  python-magic
  python-pillow
  python-pure-protobuf
  python-requests
  python-unidecode
  python-wheel
  webkit2gtk
)
makedepends=(
  gobject-introspection
  meson
)
optdepends=('org.freedesktop.secrets: store passwords safely')
source=(
  "https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz"
  "keyring.patch"
)
sha256sums=('d4ecd12d7fc3a6a3e5fde3ed03608ff48045c2e7425b66ef0fadf04941643da2'
            '43ac878f5c1f0f42e3958b0470a1af062def0715c08f661b38a996c06aff32b5')

prepare() {
  cd $_gitname-v$pkgver
  patch --forward --strip=1 --input="${srcdir}/keyring.patch"
  cd ..
}

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
