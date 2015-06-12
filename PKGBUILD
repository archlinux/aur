# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-modules
pkgver=latest
pkgrel=2
pkgdesc="a programming language to create games (Fenix successor) - modules"
arch=('i686')
url="http://sourceforge.net/projects/bennugd/"
license=('GPL')
depends=('zlib' 'libdes' 'bennugd-core' 'sdl_mixer' 'libpng')
source=("http://bennugd.svn.sourceforge.net/viewvc/bennugd.tar.gz?view=tar")
md5sums=('fba4d4c464d50730b3a39890df63c241')

build() {
  cd $srcdir/bennugd/modules
  chmod +x ./configure
  sed -i -e 's/info_ptr->trans_values/info_ptr->trans_color/' -e 's/info_ptr->trans[^_]/info_ptr->trans_alpha/' mod_map/file_png.c
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/bennugd/modules
  make DESTDIR=${pkgdir} install
}
