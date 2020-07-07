# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Francis Carroll (franciscarroll at gmail dot com)

pkgname=splix
pkgver=2.0.0
pkgrel=15
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers"
arch=('x86_64')
url="http://splix.ap2c.org/"
license=('GPL')
depends=('libcups' 'gcc-libs' 'ghostscript')
makedepends=('libcups' 'jbigkit' 'krb5' 'subversion')
install=splix.install
source=(svn://svn.code.sf.net/p/splix/code/splix#revision=315
        splix-deviceID.patch)
sha256sums=('SKIP'
            'd8540032c994d49cbe32c7831b703125b2951ef353d5f2e3320933f47073efeb')

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

# vim:set ts=2 sw=2 et:
