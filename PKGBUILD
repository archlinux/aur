# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.2
pkgrel=1
pkgdesc="Search through file contents in a given folder."
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop/"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
optdepends=('python-nautilus: Nautilus extension')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d61e89e898fd6791c386f8c0d2e25bd4f808171ff47780792f83c37f7e65bc49')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
