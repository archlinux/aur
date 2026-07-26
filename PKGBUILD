# Maintainer: L1p0 <lipovicsmartin@l1p0-industries.hu>
pkgname=l1p0-menus-git
pkgver=2.0.0.r0.689376c
pkgrel=1
pkgdesc="GTK4 Layer Shell menus for Hyprland written in Python"
arch=('any')
url="https://github.com/L1p0-M/l1p0-menus"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'gtk4-layer-shell'
    'python-pulsectl'
    'bluez'
    'networkmanager'
)
makedepends=(
    'git'
    'glib2-devel'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
provides=('l1p0-menus')
conflicts=('l1p0-menus')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | awk -F'-' '{print $1 ".r" $2 "." substr($3,2)}'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
