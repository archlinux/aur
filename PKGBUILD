# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=0.21
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64)
url="https://github.com/windytan/redsea"
license=(MIT)
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp')
source=(
  "$pkgname-$pkgver.tar.gz"::https://github.com/windytan/$pkgname/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('c0e72457b54b37b7a1a7dce71abb076b963f8510c1e6066610963283beac536e')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
