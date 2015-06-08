# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkclean
pkgver=0.8.7
pkgrel=5
pkgdesc="Clean up and optimize MKV files"
arch=('armv6h' 'i686' 'x86_64')
url="http://www.matroska.org/downloads/mkclean.html"
license=('BSD')
source=("http://sourceforge.net/projects/matroska/files/mkclean/mkclean-${pkgver}.tar.bz2")
sha1sums=('21d9dd829086fe13771815481b6c7beeb83aca88')
options=('!makeflags')

prepare() {
  cd "mkclean-${pkgver}"
  [ "${CARCH}" = "armv6h" ] && find ./corec/tools/coremake/ -type f -exec sed 's|arm-none-linux-gnueabi-||g' -i {} \;
  ./configure

  find . -name '*.mak' -exec sed "s|/usr/local|${pkgdir}/usr|g" -i {} \;
}

build(){
  cd "mkclean-${pkgver}/mkclean"
  make
}

package(){
  cd "mkclean-${pkgver}/mkclean"
  mkdir -p "${pkgdir}/usr/bin"
  make install
}
