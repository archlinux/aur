# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net> 
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=4.75.2
pkgrel=2
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=("http://www.wavpack.com/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('e8bbc4c3382f9148918ad7b896e10ac1')

build() {
  cd ${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
    --disable-asm \
    --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  cd "$pkgdir/usr"
  rm -rf {bin,include,share/man}/
}
