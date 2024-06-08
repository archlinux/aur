# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Seqularise

pkgname=rsgain
pkgver=3.5.1
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
makedepends=(cmake fmt)
source=("$pkgname-$pkgver.tar.gz::https://github.com/complexlogic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aaa72b6a30643f786a05503c18c4c2588b6539dcc781b27ba2716bec4957f3d246cdfe6be1569164535afdd4b19d70b5b5d33202dafbc8d7a7634ff6f6b20a6a')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
	install -Dm644 $pkgname-$pkgver/docs/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
