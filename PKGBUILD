# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=komikku
_author=valos
_gitname=Komikku
pkgver=0.17.0
pkgrel=1
pkgdesc='Online/offline Manga reader for GNOME, built for the Librem 5'
arch=(any)
url=https://gitlab.com/valos/Komikku
license=(GPL3)
depends=(
  gtk3
  libhandy1
  libsecret
  python
  python-beautifulsoup4
  python-cairo
  python-cloudscraper
  python-dateparser
  python-gobject
  python-lxml
  python-magic
  python-pillow
  python-pure-protobuf
  python-unidecode
)
makedepends=(
  git
  gobject-introspection
  meson
)
source=("https://gitlab.com/$_author/$_gitname/-/archive/v$pkgver/$_gitname-v$pkgver.tar.gz"
        "newer_libhandy.patch")
sha256sums=('4deb5a90ed80c1ee98266f4f3bdff4d2ffb6610b42975ce96209b3c2be14a734'
            'cf5afeac70274d9a1b68c152e40589ad7551c391275cd1d7867eddf767f42098')

prepare() {
  cd $_gitname-v$pkgver
  patch --forward --strip=1 --input="${srcdir}/newer_libhandy.patch"
  cd ..
}

build() {
  arch-meson $_gitname-v$pkgver build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
