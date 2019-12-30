# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=5.2.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes (32 bit)"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=("http://www.wavpack.com/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('456da78fb5d01b33a8ed71b43cb6809a25ca0d54e53858b93bbb3eb26923bfa6de4c6a3c01caca947c0852aea74d1b14667205dae344148a01619e67eb2c7e71')

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
