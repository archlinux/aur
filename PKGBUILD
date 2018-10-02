# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>
pkgname=tableau-sdk
pkgver=10_3_14
pkgrel=1
tableauversion=10300.18.0727.2030
pkgdesc="C/C++/Java SDK for creating and publishing extracts to a Tableau Server"
arch=('i686' 'x86_64')
url="http://tableau.com/"
license=('custom')
groups=()
depends=('curl' 'qt5-base' 'java-environment' 'gcc-libs-multilib' 'expat' \
         'boost-libs' 'icu' 'pcre' 'intel-tbb')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("http://downloads.tableau.com/tssoftware/Tableau-SDK-Linux-32Bit-${pkgver//_/-}.tar.gz")
source_x86_64=("http://downloads.tableau.com/tssoftware/Tableau-SDK-Linux-64Bit-${pkgver//_/-}.tar.gz")
md5sums_i686=('d418d74f958cd60efac3b72965f2e4f1')
md5sums_x86_64=('950debcd6308673327cd0d75c4dc5619')
validpgpkeys=()

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib/tableausdk
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mkdir -p $pkgdir/etc/ld.so.conf.d/
  if [ $CARCH == i686 ]; then
    cd tableausdk-linux32-$tableauversion
    srclibdir=lib/tableausdk
  else
    srclibdir=lib64/tableausdk
    cd tableausdk-linux64-$tableauversion
  fi
  cp -r $srclibdir/libtab* $pkgdir/usr/lib/tableausdk
  cp -r $srclibdir/libTableau* $pkgdir/usr/lib/tableausdk
  cp -r $srclibdir/libmetrics* $pkgdir/usr/lib/tableausdk
  cp -r $srclibdir/libboost*1.60.0* $pkgdir/usr/lib/tableausdk
  cp -r $srclibdir/libicu*44* $pkgdir/usr/lib/tableausdk
  cp -r $srclibdir/Java $pkgdir/usr/lib/tableausdk
  cp -r include/* $pkgdir/usr/include/
  cp -r share/* $pkgdir/usr/share/
  cp -r bin/* $pkgdir/usr/bin/
  cp share/tableausdk-$tableauversion/LICENSE.txt \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE
  echo "/usr/lib/tableausdk" > $pkgdir/etc/ld.so.conf.d/tableau-sdk.conf
}
