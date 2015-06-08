# Maintainer: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net> 
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=lib32-wavpack
_pkgname=wavpack
pkgver=4.75.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('glibc' 'wavpack')
options=('!libtool')
source=("http://www.wavpack.com/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('14e49c65efd0f3b0dea708e176a112d2')


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
    --disable-asm \
    --disable-static \
    --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}
#- ./configure --prefix=/usr --libdir=/usr/lib --enable-mmx
#+ ./configure --prefix=/usr --disable-asm

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  cd "$pkgdir/usr"
  rm -rf {bin,include,share/man}/
}
