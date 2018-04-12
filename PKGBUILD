# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkclean
pkgver=0.8.10
pkgrel=1
pkgdesc="Clean up and optimize MKV files"
arch=('x86_64')
url='http://www.matroska.org/downloads/mkclean.html'
license=('BSD')
source=("http://sourceforge.net/projects/matroska/files/mkclean/mkclean-${pkgver}.tar.bz2")
sha256sums=('96773e72903b00d73e68ba9d5f19744a91ed46d27acd511a10eb23533589777d')
options=('!makeflags')

prepare() {
  cd "mkclean-${pkgver}"

  gcc ${CFAGS} -o coremake corec/tools/coremake/coremake.c

  sed "s|/usr/local|${pkgdir}/usr|g" -i corec/tools/coremake/gcc_mak.inc

  ./coremake gcc_linux_x64
}

build(){
  make -C "mkclean-${pkgver}/mkclean"
}

package(){
  mkdir -p "${pkgdir}/usr/bin"
  make -C "mkclean-${pkgver}/mkclean" install
}
