# PKGBUILD
pkgname=rbtr-gui-git
pkgver=r1.0
pkgrel=1
pkgdesc="A simple GUI interface for rbtr"
arch=('any')
url="https://gitlab.com/vbarch/rbtr"
license=('MIT')
depends=('rbtr-git')
makedepends=('git' 'rust')
source=("$pkgname::git+https://gitlab.com/vbarch/rbtr-gui.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --locked --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/rbtr-gui "$pkgdir/usr/bin/rbtr-gui"
	install -Dm644 rbtr-gui.desktop "$pkgdir/usr/share/applications/rbtr-gui.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
