# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=password-for-gnome-vala
pkgver=1.5.7
pkgrel=1
pkgdesc="Calculator and random generator password for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/elescoute/password-for-gnome-vala"
license=('GPL3')
depends=('libadwaita' 'libsoup3')
makedepends=('meson' 'vala' 'webkitgtk-6.0')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('fe29dbd79ff4ac544212ea293f9194a97302f684dc3610e3e23d4d21f9ddaadf140a2acc2d9c67ab8289b7623ccdce9a1de1587be5853fa611364d4378c3945c')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
