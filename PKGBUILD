# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Tilman Blumenbach <tilman+aur@ax86.net>

pkgname=xcursor-openzone
pkgver=1.2.6
pkgrel=2
pkgdesc="OpenZone X11 cursor theme"
url='https://www.opendesktop.org/p/999999/'
arch=('any')
makedepends=('icon-slicer')
license=('custom:xcursor-openzone')
source=("repo::git+https://github.com/ducakar/openzone-cursors.git#tag=v${pkgver:?}")
sha384sums=('SKIP')

build() {
  cd repo
  make
}

package() {
  cd repo

  # The "build" step created a number of tarballs, each containing a variant of this cursor
  # theme.
  mkdir -p "${pkgdir:?}/usr/share/icons"
  for archive in OpenZone_*.tar.*; do
    tar xf "${archive:?}" -C "${pkgdir:?}/usr/share/icons"
  done

  # Install the license:
  install -D -m644 COPYING "${pkgdir:?}/usr/share/licenses/${pkgname:?}/COPYING"
}

# vim: ts=2 sw=2 et
