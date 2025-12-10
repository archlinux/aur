# Maintainer: Felix Bühler <account at buehler dot rocks>

pkgname=newsflash-git
_pkgname=news_flash_gtk
pkgver=2694.b432feb1
pkgrel=1
pkgdesc="The spiritual successor to FeedReader"
arch=('x86_64')
url="https://gitlab.com/news-flash/news_flash_gtk"
license=(GPL3)
depends=(
  cairo
  glib2
  glibc
  graphene
  gstreamer
  gtk4
  hicolor-icon-theme
  libadwaita
  libclapper
  libclapper-gtk
  libxml2
  openssl
  pango
  sqlite
  webkitgtk-6.0
)
makedepends=(
  appstream
  blueprint-compiler
  clang
  git
  meson
  rust
)
options=(!lto)
conflicts=(newsflash)
source=("git+https://gitlab.com/news-flash/news_flash_gtk.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_pkgname}"
  arch-meson _build
  meson compile -C _build
}

package() {
  cd "${_pkgname}"
  meson install -C _build --destdir "$pkgdir" --no-rebuild
}
