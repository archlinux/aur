# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.1
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('gtk4>=4.5.0' 'glib2' 'libadwaita>=1.0.0' 'libpwquality>=1.4.0' 'python-gobject' 'python-pykeepass>=4.0.1' 'python-pyotp>=2.4.0')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
conflicts=('gnome-passwordsafe')
replaces=('gnome-passwordsafe')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('0d9b0fc803ba754db51c91781db192d28a67137f7a6ef665097f62b73cedca1f952aa9867e9257cedb047247fe21c479311d69501a999bbab9c8de19f6c4ea6c')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
