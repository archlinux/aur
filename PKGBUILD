# Contributor: Andre Klitzing <aklitzing () gmail () com>

pkgname=msitools
pkgver=0.96
pkgrel=1
pkgdesc="Set of programs to inspect and build Windows Installer (.MSI) files"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/msitools"
license=('GPL')
depends=('libgsf' 'gcab')
makedepends=('intltool' 'vala')
source=(http://ftp.gnome.org/pub/GNOME/sources/msitools/${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('1b3e194a94747362a2d8d9b7c512c540ccb69e4dbd1dbc2d999a8a44d0b6729e')

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

