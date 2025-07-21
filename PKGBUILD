# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.4.2
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=(
  'gtksourceview5'
  'libadwaita'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
optdepends=('nautilus-python: Nautilus extension')
source=("https://gitlab.gnome.org/philippun1/snoop/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7fbdfdd90e68b153b00ef092ef35f803215139a22c5a7417e1ec13690525c223')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
