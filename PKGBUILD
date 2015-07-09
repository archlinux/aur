# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=caja-dropbox
pkgver=1.10.0
pkgrel=1
pkgdesc="Dropbox for Linux - Caja extension"
url="https://github.com/mate-desktop/caja-dropbox"
arch=('i686' 'x86_64')
license=('custom:CC-BY-ND-3' 'GPL')
depends=('caja'
         'glib2'
         'libnotify'
         'polkit'
         'procps'
         'pygtk'
         'xdg-utils')
makedepends=('mate-common' 'python2-docutils')
optdepends=('dropbox: Dropbox support')
options=('!emptydirs')
source=("http://pub.mate-desktop.org/releases/1.10/${pkgname}-${pkgver}.tar.xz")
sha1sums=('4ecb08c7671a12bc8aee3f6df2e2cb70988e95b8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  sed -i "s/python/python2/" configure.ac configure caja-dropbox.in Makefile.am Makefile.in rst2man.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
