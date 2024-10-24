# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.4.1
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/philippun1/snoop/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('73d0c7d65dcf7bfe8918ff8c2322c77fa7162ee37a2c251aeefa3bcdf2fd706f')

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
