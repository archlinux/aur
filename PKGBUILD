# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.0
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
b2sums=('6fbce1874fcaf240db5d956e437bedf9dec335d402ef38750eefc0aab2b9f5a9394583dbb9a1e7d8adcb933ca423eaf40cf53da0e887de61e83cad60b29b705f')

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
