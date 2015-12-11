# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-modules
pkgver=325
pkgrel=2
pkgdesc="a programming language to create games (Fenix successor) - modules"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('GPL')
depends=('zlib' 'libdes' 'bennugd-core' 'sdl_mixer' 'libpng')
source=("http://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-${pkgver}.zip")
md5sums=('665cb80d1b93cd552e04c2e55c3992d0')

build() {
  cd $srcdir/bennugd-code-${pkgver}/modules
  chmod +x ./configure
  sed -i -e 's/info_ptr->trans_values/info_ptr->trans_color/' -e 's/info_ptr->trans[^_]/info_ptr->trans_alpha/' mod_map/file_png.c
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/bennugd-code-${pkgver}/modules
  make DESTDIR=${pkgdir} install
}
