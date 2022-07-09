# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=5.5.0
pkgrel=2
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes (32 bit)"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=(https://github.com/dbry/WavPack/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz)
sha512sums=('9758e8079618e45e585330cd472f8ddae6e0ffd9a79032e7ec60251fff331390a619855dcdcf92942f5192d6ae12e05b6feca36394d30f0fe7e65222ee2696fc')

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
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd "$pkgdir/usr"
  rm -rf {bin,include,share/man,share/doc}/
}
