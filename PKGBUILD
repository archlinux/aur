# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributors: Seqularise, complexlogic

pkgname=rsgain
pkgver=3.5.2
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
  'libinih'
  'taglib'
  )
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/complexlogic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('330ce98d136f174c256b85163db749967a91e023d3f6baef9e929bc52e1aeb14e9c6f2a3eaef7035f6759588d0407deb83d2ce9ed2ae4b3361404bf278f25bfe')

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
