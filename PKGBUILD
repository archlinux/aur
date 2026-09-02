# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributors: Seqularise, complexlogic

pkgname=rsgain
pkgver=3.8
pkgrel=1
pkgdesc="ReplayGain 2.0 loudness normalizer"
arch=('x86_64')
url="https://github.com/complexlogic/rsgain"
license=('BSD-2-Clause')
depends=(
  'libebur128'
  'libavcodec.so'
  'libavformat.so'
  'libavutil.so'
  'libswresample.so'
  'fmt'
  'libinih'
  'taglib'
  )
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/complexlogic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ae4658498c2adc1baed3874a2f1180088b5e25f2c56169b92a6065f93c384c1fc1cd524ab5561551a0fdbc469678ae11b357cfbf51be8045377d22e7f288a759')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DUSE_STD_FORMAT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
	install -Dm644 $pkgname-$pkgver/docs/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
