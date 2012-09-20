# $Id: PKGBUILD 61158 2011-12-22 21:01:49Z lcarlier $
# Maintainer: Thomas Bächler <thomas@archlinux.org>

_pkgbasename=attr
pkgname=libx32-$_pkgbasename
pkgver=2.4.46
pkgrel=2.1
pkgdesc="Extended attribute support library for ACL support (x32 ABI)"
arch=(x86_64)
url="http://savannah.nongnu.org/projects/attr"
license=('LGPL')
depends=('libx32-glibc' $_pkgbasename)
makedepends=('gcc-multilib-x32' 'gettext')
options=('!libtool')
source=(http://download.savannah.gnu.org/releases/attr/attr-${pkgver}.src.tar.gz)
sha256sums=('dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f')

build() {
  cd ${srcdir}/attr-${pkgver} 

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  export INSTALL_USER=root INSTALL_GROUP=root
  ./configure --prefix=/usr --libdir=/usr/libx32 --libexecdir=/usr/libx32
  make 

  # Doesn't like building as non-root

#  make prefix=${pkgdir}/usr \
#    PKG_LIB_DIR=$pkgdir/usr/libx32 \
#    PKG_DEVLIB_DIR=$pkgdir/usr/libx32 \
  make DIST_ROOT="${pkgdir}" \
    install-lib install-dev

  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
