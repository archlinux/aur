# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets
pkgver=7.0
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
b2sums=('6bdb10af8b3b0efa9229a17e61f14211ae95ea610f8313f2e14256fcf20ae61ef31aa7ec626f1ebd4bb99d391b967b01f4058e3ce2f50f8f4aa4d1be7d9d86b0')

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
