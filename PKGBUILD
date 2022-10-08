# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=secrets-git
pkgver=7.0.r0.g6e0c69d8
pkgrel=1
pkgdesc="Manage your passwords"
arch=('any')
url="https://gitlab.gnome.org/World/secrets"
license=('GPL3')
depends=('libadwaita' 'libpwquality' 'python-gobject' 'python-pykeepass' 'python-pyotp' 'python-cairo' 'python-validators' 'python-zxcvbn')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=('gnome-passwordsafe-git' "${pkgname%-git}")
replaces=('gnome-passwordsafe-git' "${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
