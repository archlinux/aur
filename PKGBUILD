# Maintainer: Wojciech Kepka <wojtek.kepka@protonmail.com>
pkgname=wutag-git
pkgver=0
pkgrel=1
epoch=
pkgdesc="CLI tool for tagging files"
arch=('x86_64')
url="https://github.com/wojciechkepka/wutag"
license=('MIT')
depends=()
makedepends=('cargo' 'git' 'help2man' )
provides=("wutag")
conflicts=("wutag")
sha1sums=('SKIP')
source=("$pkgname::git+https://github.com/wojciechkepka/wutag")

build() {
	cd "$pkgname"
	cargo build --release
	help2man target/release/wutag > target/release/wutag.1
}

pkgver() {
	cd "$pkgname"
	echo "$(git log -1 --format=%cd.%h --date=short|tr -d -)"
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/wutag" "$pkgdir/usr/bin/wutag"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "target/release/wutag.1" "$pkgdir/usr/share/man/man1/wutag.1"
}
