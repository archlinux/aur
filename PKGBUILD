# Contributor: Sietse van der Molen
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gprbuild
pkgver=2015
pkgrel=1

depends=('gcc-ada' 'xmlada')

pkgdesc="Software tool designed to help automate the construction of multi-language systems"

arch=('any')
license=('GPL')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild/"

#source=("http://downloads.dragonlace.net/src/${pkgname}-gpl-${pkgver}-src.tar.gz"
#        "https://www.assembla.com/spaces/openada/documents/aNlX7o4oyr5lxdacwqjQWU/download/aNlX7o4oyr5lxdacwqjQWU"
#        "patch-src_gpr__version.adb"
#       "extrapatch-src_gprbuild-main.adb"
#        "extrapatch-src_rewrite__data.ada"
#        "extrapatch-5-gprbuild-slave.adb"
#        "extrapatch-protocol.adb"
#        "patch-src_gprinstall-install.adb"
#        "extrapatch-src_gprslave.adb")

source=("http://mirrors.cdn.adacore.com/art/3c2da2f1d3335d39bc9ebb65a3a58264ddac6d41")


sha256sums=('5d5bbc8c57075250c264e2f15d9949383450ac696eb8a90803c2a36b55ecd0e2')


build() {
  export OS=unix

  cd $pkgname-gpl-$pkgver-src

  rm -fr gnat
  cp -r ../gnat .

  find -name '*.adb' -print -exec sed -i.bak 's/Try_Help;//g' {} \;

  rm -fr src/rewrite_data.ads
  rm -fr src/rewrite_data.adb

#  patch -p0 -i ../patch-src_gpr__version.adb
#  patch -p0 -i ../extrapatch-src_gprbuild-main.adb
#  patch -p0 -i ../extrapatch-src_rewrite__data.ada
#  patch -p0 -i ../extrapatch-5-gprbuild-slave.adb
#  patch -p0 -i ../extrapatch-protocol.adb
#  patch -p0 -i ../patch-src_gprinstall-install.adb
#  patch -p0 -i ../extrapatch-src_gprslave.adb

  ./configure --prefix="/usr"
  make all
}


package() {
  cd $pkgname-gpl-$pkgver-src
  make prefix="$pkgdir/usr" install
}
