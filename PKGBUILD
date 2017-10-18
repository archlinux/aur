# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-modules
pkgver=344
pkgrel=1
pkgdesc="a programming language to create games (Fenix successor) - modules"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('zlib')
depends=('zlib' 'bennugd-core' 'sdl_mixer' 'libpng')
source=("http://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-${pkgver}.zip")
md5sums=('SKIP')

build() {
  cd $srcdir/bennugd-code-${pkgver}/modules
  chmod +x ./configure
  sed -i -e 's/info_ptr->trans_values/info_ptr->trans_color/' -e 's/info_ptr->trans[^_]/info_ptr->trans_alpha/' mod_map/file_png.c
  ./configure --prefix=/usr --build=i686-pc-linux-gnu
  make
}

package() {
  cd $srcdir/bennugd-code-${pkgver}/modules
  make DESTDIR=${pkgdir} install
}
