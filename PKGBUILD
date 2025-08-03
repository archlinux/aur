# $Id$
# Maintainer: Ruben De Smet <me@rubdos.be>

pkgname=sqlite-vec
pkgver=0.1.6
pkgrel=1
pkgdesc="A vector search SQLite extension that runs anywhere!"
arch=(i686 x86_64 armv7h aarch64)
license=('Apache')
depends=()
makedepends=('git' 'gcc' 'pkgconf' 'sqlite')
url="https://github.com/asg017/sqlite-vec/"
sha256sums=('2df2c99d8ac53f88b0944bbca078993b348ae3f1a164bc97570d47b9563effea')
# source=('sqlite-vec::git+https://github.com/asg017/sqlite-vec.git')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd $srcdir/sqlite-vec-${pkgver}

  make loadable static
}

package() {
  cd $srcdir/sqlite-vec-${pkgver}

  INSTALL_LIB_DIR="$pkgdir"/usr/lib/
  INSTALL_INCLUDE_DIR="$pkgdir"/usr/include/
  INSTALL_BIN_DIR="$pkgdir"/usr/bin/

  install -d $INSTALL_LIB_DIR
  install -d $INSTALL_INCLUDE_DIR
  install -m 644 sqlite-vec.h $INSTALL_INCLUDE_DIR
  install -m 644 dist/vec0.so $INSTALL_LIB_DIR
  install -m 644 dist/libsqlite_vec0.a $INSTALL_LIB_DIR

  # XXX Makefile contains an ldconfig call.
  # make \
  #   INSTALL_LIB_DIR="$pkgdir"/usr/lib/ \
  #   INSTALL_INCLUDE_DIR="$pkgdir"/usr/include/ \
  #   INSTALL_BIN_DIR="$pkgdir"/usr/bin/ \
  #   install
}
