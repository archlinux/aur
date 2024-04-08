# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=extension-manager
pkgver=0.5.0
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'json-glib' 'text-engine')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
optdepends=('libbacktrace-git')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('d1d1a2540c2cc74d3e3bb46dd58bf18d4d46e600293a973cd6269cc2467415dc')

build() {
  arch-meson $pkgname-$pkgver build -Dbacktrace=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
