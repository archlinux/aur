# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=torrent7z
pkgver=1.3
pkgrel=1
pkgdesc="A derivative of 7zip that produces invariant .7z archives for torrenting"
arch=('i686' 'x86_64')
url="https://github.com/BubblesInTheTub/$pkgname"
license=('GPL3')
depends=('gcc-libs')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"0001-$pkgname-fix-gcc-error.patch::$url/pull/9.patch"
)
b2sums=(
	'61fae6f2938ef4eebd4c7718e152c3b220dcf7446c479014a5f788b70bdb63c6f0cbf81d4467f18ef9db3ef84abe066865b03a50429435ace95003a44d19cbae'
	'8bfb5314e5c6055d7d9611c0f73f0d3fc42b0e8f5843eed8c841ec6919587ef193ff44c0a50f12170881e3f4542124c0d20a56fbdc75c148f84a44e2dcced376'
)

prepare() {
	patch -d $pkgname-$pkgver -Np1 < 0001-$pkgname-fix-gcc-error.patch
}

build() {
	make -C $pkgname-$pkgver/linux_src/p7zip_4.65
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/bin $pkgname-$pkgver/linux_src/p7zip_4.65/bin/t7z
}
