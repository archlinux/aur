# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=7.3
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('libadwaita' 'libpwquality' 'python-gobject' 'python-pykeepass' 'python-pyotp' 'python-cairo' 'python-validators' 'python-zxcvbn')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=('gnome-passwordsafe')
conflicts=('gnome-passwordsafe')
replaces=('gnome-passwordsafe')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('3decd2b58e5a7c3b7bd679fb0e63688685588ef7f192efc2620f0fc16c2071b285f0bd7fd187e24094b4b06c77478d99819185a76aa27855702e6165559f6467')

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
