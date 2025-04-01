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
source=(git+https://github.com/mjakeman/$pkgname.git#tag=v$pkgver)
md5sums=(SKIP)

build() {
    arch-meson $pkgname build -Dbacktrace=false
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs || :
}

package() {
    meson install -C build --destdir "$pkgdir"
}
