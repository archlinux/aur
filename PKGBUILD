# Maintainer: ValHue <vhuelamo at gmail dot com>
#
#
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>
#
pkgname="caja-dropbox"
pkgver="1.20.0"
pkgrel="1"
pkgdesc="Dropbox extension for Caja file manager "
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/caja-dropbox"
license=('custom:CC-BY-ND-3' 'GPL')
groups=('caja-extensions')
depends=('caja' 'glib2' 'libnotify' 'polkit' 'procps' 'pygtk' 'xdg-utils')
optdepends=('dropbox: Dropbox support')
makedepends=('mate-common' 'python2-docutils')
source=("${pkgname}-${pkgver}.tar.xz::https://pub.mate-desktop.org/releases/1.20/${pkgname}-${pkgver}.tar.xz")
sha256sums=('721f2c7df9f27c63438bfdd9ef26d5402b30eca497ae73b8771a1a5ba2635876')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
  sed -i "s/python/python2/" configure.ac configure caja-dropbox.in Makefile.am Makefile.in rst2man.py
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh
