# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributors: Seqularise, complexlogic

pkgname=rsgain
pkgver=3.6
pkgrel=2
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
sha512sums=('375a9b7ffafa6e54c3ea390568b3b38fab5ac64e8d5449c16beaa5997a00e0be51ff7b83299986abc461ba43ccfac0c812d72ef5969b901a7461bf3d08f83219')

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
