# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>
pkgname=tableau-sdk
pkgver=9_2_0
pkgrel=1
pkgdesc="C/C++/Java SDK for creating and publishing extracts to a Tableau Server"
arch=('i686' 'x86_64')
url="http://tableau.com/"
license=('custom')
groups=()
depends=('curl' 'qt5-base' 'java-environment' 'gcc-libs-multilib' 'expat' \
                'boost-libs')
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
noextract=('libcurl.so' 'libcurl.so.4' 'libcurl.so.4.4.0')
md5sums_i686=('47c620440759ad2a5c80fff0a0258974')
md5sums_x86_64=('3816a83ea5e0c4b3a2e8d96d4b62fb57')
validpgpkeys=()

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir $pkgdir/usr/include
  mkdir $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  if [ $CARCH == i686 ]; then
    cd tableausdk-linux32-9200.15.1201.0018
    cp -r bin/* $pkgdir/usr/bin/
    cp -r include/* $pkgdir/usr/include/
    cp -r lib/* $pkgdir/usr/lib/
    cp -r share/* $pkgdir/usr/share/
  else
    cd tableausdk-linux64-9200.15.1201.0018
    cp -r bin/* $pkgdir/usr/bin/
    cp -r include/* $pkgdir/usr/include/
    cp -r lib64/* $pkgdir/usr/lib/
    cp -r share/* $pkgdir/usr/share/
  fi
  cp share/tableausdk-9200.15.1201.0018/LICENSE.txt \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE
  echo "/usr/lib/tableausdk" > $pkgdir/etc/ld.so.conf.d/tableau-sdk.conf
}
