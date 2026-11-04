# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/aur-git.yml (or scripts/render-pkgbuild.sh).
# This is a VCS package: the source moves with main, so the checksum must be
# SKIP. Use the `rawm-control` package for a pinned release tarball + SHA-256.
pkgname=rawm-control-git
pkgver=0.1.10
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for RAWM gaming mice (git)"
arch=('any')
url="https://github.com/NasirA1991/rawm-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=('git')
provides=('rawm-control')
conflicts=('rawm-control')
source=("$pkgname::git+https://github.com/NasirA1991/rawm-control.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local base
  base=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//') || base=0.1.2
  printf '%s.r%s.g%s' "${base:-0.1.2}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
