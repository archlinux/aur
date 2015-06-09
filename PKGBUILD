# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szs-svn
pkgver=5897
pkgrel=1
pkgdesc="A set of command line tools to manipulate SZS, U8, BRRES, BREFF, BREFT, BMG, KMP, TEX, TPL, and StaticR.rel files of Mario Kart Wii"
arch=(i686 x86_64)
url="http://szs.wiimm.de/"
license=(GPL)
depends=(libpng)
makedepends=(subversion)
provides=(szs szstools)
conflicts=(szs szstools)
source=('svn+http://opensvn.wiimm.de/wii/trunk/wiimms-szs-tools/')
sha512sums=('SKIP')

pkgver() {
  cd wiimms-szs-tools
  svnversion | tr -d [A-z]
}

build() {
  cd wiimms-szs-tools

  # Fix linker error against libm
  export CFLAGS+=" -lm"
  make INSTALL_PATH="${pkgdir}/usr"
}

package() {
  cd wiimms-szs-tools
  ./install.sh
}
