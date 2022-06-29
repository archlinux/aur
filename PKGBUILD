# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-core
pkgver=356
pkgrel=1
pkgdesc="a programming language to create games (Fenix successor) - core"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('zlib')
depends=('openssl' 'gcc-libs')
if [[ "$CARCH" = "x86_64" ]]; then
    depends=('lib32-openssl' 'lib32-gcc-libs')
fi
source=("https://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-r${pkgver}.zip" x86_64-configure.patch)
md5sums=('SKIP' 'bee8ea76634b5e0dbaf29c9b6d3b147f')

build() {
    cd $srcdir/bennugd-code-r${pkgver}/core
    chmod +x ./configure
    ./configure --prefix=/usr --build=i686-pc-linux-gnu
    #patch -p0 -i $srcdir/x86_64-configure.patch
    #find . -name Makefile -print0 | xargs -0 sed -i 's/--as-needed//'
    make
}

package() {
    make -C $srcdir/bennugd-code-r${pkgver}/core DESTDIR=${pkgdir} install
}
