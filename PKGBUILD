# Maintainer: mcp <mcp@praeger.org>
pkgname=tztail-git
pkgver=r16.ceea0a6
pkgrel=1
pkgdesc='tztail (TimeZoneTAIL) allows you to view logs in the timezone you want'
arch=('any')
url='https://github.com/thecasualcoder/tztail'
license=('MIT')
makedepends=('git' 'rust')
provides=('tztail')
source=('tztail::git+git://github.com/thecasualcoder/tztail#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
	cargo build --release
	strip ./target/release/tztail
	install -Dm755 ./target/release/tztail $pkgdir/usr/bin/tztail
}
