# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=password-for-gnome-vala
pkgver=1.5.8
pkgrel=1
pkgdesc="Calculator and random generator password for GNOME"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/elescoute/password-for-gnome-vala"
license=('GPL3')
depends=('libadwaita' 'libsoup3')
makedepends=('meson' 'vala' 'webkitgtk-6.0')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('b81c760ba57429e98fe8e857c1cb48abde47fb685dc2e3d4c2bf7be0015b3d1797d1ad6422b74f332fcc234e313f52c041c808c3e71229198e6485426662d9aa')

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
