# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=yaze
pkgver=2.40.5
pkgrel=1
license=('GPL')
pkgdesc='Yet Another z80 (CP/M) Emulator'
arch=("i686" "x86_64")
url='http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/'
source=("http://www.mathematik.uni-ulm.de/users/ag/yaze-ag/devel/yaze-ag-${pkgver}_with_keytrans.tar.gz"
        "yaze.patch")
sha256sums=('d46c861eb0725b87dd5567062f277860b98d538fca477d8686f17b36ef39d9bd'
           'c0abd301728f95ccd825e3f17c56a743307c219a5fd046782105e65d552e6056')

prepare() {
  cd ${pkgname}-ag-${pkgver}_with_keytrans

  patch -p1 -i ../yaze.patch
  cp Makefile_linux_32_i586 Makefile
}

build() {
  cd ${pkgname}-ag-${pkgver}_with_keytrans

  [[ ${CARCH} == x86_64 ]] && _BUILD='" (build for x86_64Bit (x86-64))"'
  [[ ${CARCH} == i686 ]] && _BUILD='" (build for x86_32Bit (i686))"'

  make PREFIX=/usr BUILD="${_BUILD}" OPTIMIZE="${CFLAGS/-O2/-O3}"
}

package() {
  cd ${pkgname}-ag-${pkgver}_with_keytrans

  make PREFIX="${pkgdir}/usr" install
}

