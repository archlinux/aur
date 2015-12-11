# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-core
pkgver=325
pkgrel=3
pkgdesc="a programming language to create games (Fenix successor) - core"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bennugd/"
license=('GPL')
depends=('libdes' 'openssl')
source=("http://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-${pkgver}.zip" x86_64-configure.patch)
md5sums=('665cb80d1b93cd552e04c2e55c3992d0'
         'bee8ea76634b5e0dbaf29c9b6d3b147f')

build() {
  cd $srcdir/bennugd-code-${pkgver}/core
  chmod +x ./configure
  ./configure --prefix=/usr
  patch -p0 -i $srcdir/x86_64-configure.patch
  #find . -name Makefile -print0 | xargs -0 sed -i 's/--as-needed//'
  make
}

package() {
  cd $srcdir/bennugd-code-${pkgver}/core
  make DESTDIR=${pkgdir} install
}
