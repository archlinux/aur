# Maintainer: Øystein Tveit <h7x4abk3g@protonmail.com>
pkgname='boomer-git'
pkgver=r286.cc0f531
pkgrel=1
pkgdesc="Zoomer application for Linux."
arch=('x86_64')
url="https://github.com/tsoding/boomer"
license=('MIT')

depends=(
	'mesa'
	'libx11'
	'libxext'
	'libxrandr'
)
makedepends=('git' 'nimble')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("boomer::git+https://github.com/tsoding/boomer.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	nimble -y install
}

build() {
	cd "$srcdir/${pkgname%-git}"
	nimble -y build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 ./boomer "$pkgdir/usr/bin/boomer"
  install -Dm644 ./demo.gif "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

