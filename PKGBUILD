# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributors: Seqularise, complexlogic

pkgname=rsgain
pkgver=3.7
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
sha512sums=('84786e2ecdc83d703a0c057fc60ba7b220d766fb61d1777586f911d546026729d3542497f3d494957d47b8c7f5de2c66873421c7bcc0bb8850ce0e588f21018d')

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
