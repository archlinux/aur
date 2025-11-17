# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=muro
pkgver=0.2.5
pkgrel=1
pkgdesc='Wallpaper with blurred or averaged background for any background tool'
arch=('x86_64' 'aarch')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=(
	'go'
	'just'
)
depends=(
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cc751247ff3a415599cbda78c370c618d11f14363d1fe73e083a4816281aa45d')
options=("!debug")

prepare() {
	cd "$pkgname"
	mkdir -p build/
}

build() {
	cd "$pkgname"
	just build-release
}

check() {
	cd "$pkgname"
	just test
}

package() {
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "$srcdir/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
