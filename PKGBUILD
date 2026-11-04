# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
pkgname=madlions-control-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for MADLIONS magnetic-switch keyboards (git)"
arch=('any')
url="https://github.com/NasirA1991/madlions-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'hicolor-icon-theme')
makedepends=('git')
provides=('madlions-control')
conflicts=('madlions-control')
options=('!strip')
source=("$pkgname::git+https://github.com/NasirA1991/madlions-control.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local base
  base=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//') || base=0.1.0
  printf '%s.r%s.g%s' "${base:-0.1.0}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
