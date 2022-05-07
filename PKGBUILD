# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.5
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('glib2' 'libadwaita' 'libpwquality>=1.4.0' 'python-gobject' 'python-pykeepass>=4.0.1' 'python-pyotp>=2.4.0' 'python-cairo')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
conflicts=('gnome-passwordsafe')
replaces=('gnome-passwordsafe')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('02f243769dd6bea0a8a6c378f49905ea4d81963354385e0781992b3c264a2eb7edad66533e537e8d31304ce6b7f5c055e313a5092d4ed7d5a15af21e299551bd')

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
