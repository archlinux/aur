# Contributor: Andre Klitzing <aklitzing () gmail () com>

_gitname=msitools
pkgname=$_gitname-git
pkgver=r694.c7b6840
pkgrel=1
pkgdesc="Set of programs to inspect and build Windows Installer (.MSI) files"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/msitools"
license=('GPL')
depends=('libgsf' 'gcab')
conflicts=('msitools')
provides=('msitools')
makedepends=('intltool' 'vala')
source=(git+https://github.com/GNOME/msitools)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  sed -i 's|LIBTOOL = $(SHELL) $(top_builddir)/libtool|LIBTOOL = /usr/bin/libtool|g' Makefile
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="${pkgdir}"
}
