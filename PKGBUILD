# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=extension-manager-git
pkgver=0.4.0.r34.g5b1fa91
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine' 'libbacktrace-git')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection' 'python-gobject')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
