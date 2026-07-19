# Maintainer: Faugus <felix.ribeiro@live.com>

pkgname=faugus-launcher-git
pkgver=r1773.5c714bb
pkgrel=1
pkgdesc="A simple and lightweight app for running Windows games using UMU-Launcher"
arch=('any')
url="https://github.com/Faugus/faugus-launcher"
license=('MIT')
depends=('python-gobject' 'python-requests' 'python-pillow' 'python-vdf' 'python-psutil' 'python-dbus' 'icoextract' 'gtk4' 'libadwaita' 'libmanette')
makedepends=('git' 'meson')
provides=('faugus-launcher')
conflicts=('faugus-launcher')
source=("git+https://github.com/Faugus/faugus-launcher.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/faugus-launcher"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "faugus-launcher"
    arch-meson . build
    meson compile -C build
}

package() {
    cd "faugus-launcher"
    DESTDIR="${pkgdir}" meson install -C build
}
