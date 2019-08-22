# Maintainer: Skye Viau <skye.viau@gmail.com>
# Contributor: Laurent Mouillart <lmouillart@gmail.com>

pkgname=gnome-kra-ora-thumbnailer-git
pkgver=1.4.r0.g53b68a1
epoch=1
pkgrel=2
pkgdesc="A thumbnailer for KRA ( Krita native file ) and ORA ( open-raster ) for the Gnome desktop"
depends=('libarchive' 'gdk-pixbuf2')
makedepends=('git' 'gnome-common' 'automake' 'intltool')
arch=(i686 x86_64)
url="https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer"
license=('GPL')
source=("git+https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer.git")
_gitname="gnome-kra-ora-thumbnailer"
noextract=()

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/${_gitname}
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
}

md5sums=('SKIP')

