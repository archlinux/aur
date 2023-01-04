# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

_pkgname=wavpack
pkgname=lib32-wavpack
pkgver=5.6.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes (32 bit)"
arch=('x86_64')
url="http://www.wavpack.com/"
license=('BSD')
depends=('lib32-glibc' 'wavpack')
source=(https://github.com/dbry/WavPack/releases/download/$pkgver/$_pkgname-$pkgver.tar.xz)
sha512sums=('7421eff1f6e18f2e698b367ca48f6773456d0fcb53241be70149a87eff2cdf14dd8a82845a016f59ed32c7df494d018e6e23495709d3a56500b0660f177d5c0f')

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
