# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-modules
pkgver=356
pkgrel=1
pkgdesc="a programming language to create games (Fenix successor) - modules"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('zlib')
depends=('zlib' 'bennugd-core' 'sdl_mixer' 'libpng')
if [[ "$CARCH" = "x86_64" ]]; then
    depends=('lib32-zlib' 'bennugd-core' 'lib32-sdl_mixer' 'lib32-libpng')
fi
source=("https://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-r${pkgver}.zip")
md5sums=('SKIP')

prepare() {
    cd $srcdir/bennugd-code-r${pkgver}/modules
    chmod +x ./configure
    sed -i -e 's/info_ptr->trans_values/info_ptr->trans_color/' -e 's/info_ptr->trans[^_]/info_ptr->trans_alpha/' mod_map/file_png.c
    sed -i -e '/fmul/s%^%// %' -e '/fdiv/s%^%// %' ../core/include/fmath.h
}

build() {
    cd $srcdir/bennugd-code-r${pkgver}/modules
    ./configure --prefix=/usr --build=i686-pc-linux-gnu
    make
}

package() {
    make -C $srcdir/bennugd-code-r${pkgver}/modules DESTDIR=${pkgdir} install
}
