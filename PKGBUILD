# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=5.4.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes (32 bit)"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=("http://www.wavpack.com/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('6575c63c9309023ad4bd1711e2d7684ac6a5b61879514342b79f04453d7495e59592dc08d3de4d4cc6c64d6bdf56e361587d425f21fac084cb441fb70d83b6d8')

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
