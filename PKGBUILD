# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.4
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/philippun1/snoop/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('106ea09132fd7e4120a8a9868547d61905e46dc2a0080ecd8e934cee3abb7dd2')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Nautilus plugin only supported with Flatpak
  rm -rv "$pkgdir/usr/share/nautilus-python"
}
