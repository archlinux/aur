# Maintainer: MuntasirSZN <muntasir.joypurhat@gmail.com>
pkgname=getquotes-git
pkgver=r1.0
pkgrel=1
pkgdesc="A simple command-line tool to fetch random quotes (built from source)."
arch=('x86_64')
url="https://github.com/MuntasirSZN/getquotes"
license=('MIT')
depends=('cargo')
makedepends=('git' 'rust')
source=("git+https://github.com/MuntasirSZN/getquotes.git")
sha256sums=('SKIP')
conflicts=('getquotes')

pkgver() {
	cd "$srcdir/getquotes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/getquotes"
	cargo build --release
}

package() {
	cd "$srcdir/getquotes"
	install -Dm755 target/release/getquotes "$pkgdir/usr/bin/getquotes"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/getquotes.1" "$pkgdir/usr/share/man/man1/getquotes.1"
}
