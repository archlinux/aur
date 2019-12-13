# Contributor: Andre Klitzing <aklitzing () gmail () com>

pkgname=msitools
pkgver=0.100
pkgrel=1
pkgdesc="Set of programs to inspect and build Windows Installer (.MSI) files"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/msitools"
license=('GPL')
depends=('libgsf' 'gcab')
makedepends=('intltool' 'vala')
source=(http://ftp.gnome.org/pub/GNOME/sources/msitools/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('bbf1a6e3a9c2323b860a3227ac176736a3eafc4a44a67346c6844591f10978ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  sed -i 's|LIBTOOL = $(SHELL) $(top_builddir)/libtool|LIBTOOL = /usr/bin/libtool|g' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
}

