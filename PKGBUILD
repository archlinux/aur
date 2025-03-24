# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=extension-manager
pkgver=0.6.2
pkgrel=1
pkgdesc="A native tool for browsing, installing, and managing GNOME Shell Extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/extension-manager"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libsoup3' 'json-glib' 'libxml2')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'glib2-devel')
checkdepends=('appstream-glib')
optdepends=('libbacktrace-git')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('02797aa4197d9d0cc4466e50c6fded51bb9164a33ff036fdd5eb51674a2346cd')

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
