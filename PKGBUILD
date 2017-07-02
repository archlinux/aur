# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=geeqie-lirc
pkgver=1.3
pkgrel=3
pkgdesc="A lightweight image browser and viewer with remote support (LIRC)"
_cpkgname="geeqie-1.3"
arch=('i686' 'x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk2' 'lcms2' 'lirc')
makedepends=('intltool' 'doxygen' 'gnome-doc-utils')
optdepends=('librsvg: SVG rendering'
	'fbida: for jpeg rotation')
conflicts=('geeqie' 'geeqie-git')
provides=('geeqie')
source=("http://www.geeqie.org/${_cpkgname}.tar.xz" '0001-Work-around-changed-c-11-std-string-implementation.patch')
sha1sums=('f991b44d8587f2f42d5793700c5f6882bed6abf9'
          '45dea6145ab6d74ed69a81a6e5871300f51450eb')

prepare() {
  cd "${srcdir}/${_cpkgname}"
  patch -Np1 -i ../0001-Work-around-changed-c-11-std-string-implementation.patch
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_cpkgname}"
  ./configure --prefix=/usr --enable-lirc --disable-gtk3
  make
}

package(){
  cd "${srcdir}/${_cpkgname}"
  make DESTDIR="${pkgdir}" install
}
