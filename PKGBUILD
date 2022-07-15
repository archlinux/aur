# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.5
pkgrel=2
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('libadwaita' 'libpwquality' 'python-gobject' 'python-pykeepass' 'python-pyotp' 'python-cairo')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
conflicts=('gnome-passwordsafe')
replaces=('gnome-passwordsafe')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
  pykeepass-4.0.3.patch)
b2sums=('02f243769dd6bea0a8a6c378f49905ea4d81963354385e0781992b3c264a2eb7edad66533e537e8d31304ce6b7f5c055e313a5092d4ed7d5a15af21e299551bd'
        'f99eb0ee86fe3ebd8985cb68a2a7e5d7b3491882fae0e082b02de2d76405078a44a5da31fa7ecad5619e9f253d7ee6155fc2f52b42bd2aee2d5434d48343112e')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../pykeepass-4.0.3.patch # Port to pykeepass 4.0.3
}

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
