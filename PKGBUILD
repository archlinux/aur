# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Davide Depau <davide@depau.eu>

_pkgname=authenticator
pkgname=$_pkgname-git
pkgver=4.0.3.r47.g900b5bd
pkgrel=1
pkgdesc="2FA code generator for GNOME "
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL3')
depends=('gtk4' 'glib2' 'libsecret' 'zbar' 'libadwaita' 'gstreamer')
makedepends=('git' 'meson' 'ninja' 'gobject-introspection' 'rust')
provides=('authenticator')
conflicts=('authenticator')
source=("$_pkgname::git+https://gitlab.gnome.org/World/Authenticator.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

