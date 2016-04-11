# Maintainer: Kevin Boxhoorn
# Contributor: Jack O'Connor

# Adapted from
# https://aur.archlinux.org/packages/gnome-shell-extension-topicons, with a
# different upstream.

pkgname=gnome-shell-extension-topicons-git
pkgver=9.40b4b26
pkgver() {
  cd "$srcdir/topicons"
  echo "$(git rev-list --count master).$(git rev-parse --short master)"
}
pkgrel=1
pkgdesc='Shows legacy tray icons on top.'
arch=('any')
url='https://github.com/wincinderith/topicons'
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
source=('git+https://github.com/wincinderith/topicons')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/topicons"

  # Edit the install path to point inside $pkgdir.
  sed -i "s|EXT_DIR=.*|EXT_DIR=$pkgdir/usr/share/gnome-shell/extensions|" Makefile

  make install
}
