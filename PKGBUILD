# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Seqularise

pkgname=rsgain
pkgver=3.4
pkgrel=2
pkgdesc="ReplayGain 2.0 loudness normalizer"
arch=('x86_64')
url="https://github.com/complexlogic/rsgain"
license=('custom')
depends=('fmt' 'libebur128' 'taglib' 'ffmpeg' 'libinih')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/complexlogic/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('75df281d1ad2dc34adc84545eef18677ce026260f7da16e4741f4dcf4a53a77cb2b490a65f0cdbb75a4e08be5c36d6dd8c96154295f52b8779d54159798fdb3b')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/README.md "$pkgdir"/usr/share/docs/$pkgname/README.md
	install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
