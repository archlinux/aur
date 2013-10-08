# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Francis Carroll (franciscarroll at gmail dot com)

pkgname=splix
pkgver=2.0.0
pkgrel=12
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers"
arch=('i686' 'x86_64')
url="http://splix.ap2c.org/"
license=('GPL')
depends=('libcups' 'gcc-libs' 'ghostscript>=9.02')
makedepends=('libcups' 'jbigkit' 'krb5')
install=splix.install
source=(svn://svn.code.sf.net/p/splix/code/splix#revision=315
        splix-deviceID.patch)
md5sums=('SKIP'
         '674b6880dcee844e0e7f50baae0dc09f')

prepare() {
  cd splix
  patch -Np1 -i ../splix-deviceID.patch
}

build() {
  cd splix
  CXXFLAGS+=" -fno-strict-aliasing"
  make drv
  make all DRV_ONLY=1
}

package() {
  cd splix
  make DESTDIR="$pkgdir" install DRV_ONLY=1
}
