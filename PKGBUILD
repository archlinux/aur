# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.3.1
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/philippun1/snoop/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('68d0cc78b2255777fb75829cde312d79252b7ce4abc12a59e1fabf4656373179')

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
  rm -r "$pkgdir/usr/share/nautilus-python"
}
