# Contributor: Hinrich Harms <arch@hinrich.de>
# Contributor: sylvain alborini <sylvain.alborini@gmail.com>
# Maintainer: John Wallaby <drunken.wallaby@gmail.com>

_pkgname=gpscorrelate
pkgname=gpscorrelate-git
pkgver=r149.a6bc064
pkgrel=4
pkgdesc='GPS Photo Correlation; Writes location data to EXIF tags using GPX files (command line and GTK interface).'
url='https://github.com/freefoote/gpscorrelate'
license=('GPL')
source=('git+https://github.com/dfandrich/gpscorrelate')
sha256sums=('SKIP')
arch=('any')
depends=('libxml2' 'gtk2' 'exiv2')
makedepends=('git' 'libxslt')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  make CFLAGS=-DENABLE_NLS prefix=/usr DESTDIR=$pkgdir install install-po || return 1
  install -Dm644 gpscorrelate-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gpscorrelate-gui.svg"
  install -Dm644 gpscorrelate.desktop "$pkgdir/usr/share/applications/gpscorrelate.desktop"
}


# vim: ft=sh ts=2 sw=2 et
