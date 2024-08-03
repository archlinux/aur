# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.3.2
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/philippun1/snoop/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5911ceb1a7c49b4ede433ec1beaab7b77c8d7e94907fdd855d7946a8c29f67a3')

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
