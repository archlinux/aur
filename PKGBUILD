# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: whatah <whatah@gmail.com>
# Contributor: Andrew Conkling <andrewski@fr.st>

pkgname=pympd
pkgver=0.08.1
pkgrel=6
pkgdesc="A Rhythmbox-like PyGTK+ client for Music Player Daemon"
arch=('x86_64')
url="http://pympd.sourceforge.net/"
license=('GPL')
depends=('libglade' 'pygtk')
makedepends=('pkg-config')
options=('!emptydirs')
source=(http://pympd.sourceforge.net/files/$pkgname-$pkgver.tar.gz)
sha256sums=('8da3b91c06857c486321a1d2769c035becd90286ce03791aa2058b0a5f620a06')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  # python2 fix
  sed -i 's_which python_which python2_' Makefile
  sed -i 's_python -c_python2 -c_' src/modules/tray/Makefile
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
