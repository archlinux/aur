# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.2
pkgrel=2
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('gtk4>=4.5.0' 'glib2' 'libadwaita>=1.0.0' 'libpwquality>=1.4.0' 'python-gobject' 'python-pykeepass>=4.0.1' 'python-pyotp>=2.4.0' 'python-cairo')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
conflicts=('gnome-passwordsafe')
replaces=('gnome-passwordsafe')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('96355ac9c925932a13749215d57fe7bd25c939f8de0e59d2c6a4ac376326e04a1ec5eef2f74fb3e14043dc358374806ae06b8c2dc1ba2441861b34f76f62d750')

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
