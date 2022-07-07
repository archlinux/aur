# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=clipmon-git
pkgver=r49.ed0d771
pkgrel=1
pkgdesc="clipmon monitors the wayland clipboard and does two things"
arch=(x86_64)
url="https://git.sr.ht/~whynothugo/clipmon"
license=(MIT)
depends=(gcc-libs)
makedepends=(git rust)
provides=(clipmon)
conflicts=(clipmon)
source=('clipmon::git+https://git.sr.ht/~whynothugo/clipmon')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/clipmon"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/clipmon"
    cargo build --release
}

package() {
	cd "$srcdir/clipmon"
	make DESTDIR="$pkgdir/" install
    install -m 644 -D LICENCE $pkgdir/usr/share/licenses/clipmon-git/LICENSE
}
