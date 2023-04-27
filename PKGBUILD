# Maintainer: Simon Repp <simon@fdpl.io>

pkgname=faircamp-git
pkgver=r425.7870267
pkgrel=1
pkgdesc='A static site generator for audio producers'
arch=('x86_64')
license=('AGPL3')
depends=('ffmpeg' 'libvips>=8.13.3' 'opus')
makedepends=('git' 'rust')
url='https://simonrepp.com/faircamp'
conflicts=('faircamp')
provides=('faircamp')
source=('faircamp-git::git+https://codeberg.org/simonrepp/faircamp.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --features libvips --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
