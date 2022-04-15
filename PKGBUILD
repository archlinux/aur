# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=6.4
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
b2sums=('9c974cb5930afb741644bc2a698f4a570534be3537607dc69c80b44cd646de5345ca97e9674679e177ec031a8bdb4c18283badf0716f749fec3f75b46ae63d1b')

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
