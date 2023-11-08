# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=i3wsr-git
pkgver=2.1.1.r5.g7792fd8
pkgrel=1
pkgdesc="A small program to change the name of an i3 workspace based on its contents."
url="https://github.com/roosta/i3wsr"
depends=('i3-wm')
makedepends=('cargo' 'git' 'python')
arch=('i686' 'x86_64')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('MIT')
source=("$pkgname::git+https://github.com/roosta/i3wsr.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
