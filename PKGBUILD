# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=phantun
pkgname="${_pkgname}-git"
pkgver=0.8.1.r4.g7f7da10
pkgrel=1
pkgdesc='Transforms UDP stream into (fake) TCP streams.'
arch=('x86_64' 'loong64')
url="https://github.com/dndx/phantun"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/dndx/phantun.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd "$srcdir"/phantun
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/phantun
	cargo build --release --locked
}

package() {
	cd "$srcdir"/phantun

	install -vDm755 target/release/client "$pkgdir"/usr/bin/phantun_client
	install -vDm755 target/release/server "$pkgdir"/usr/bin/phantun_server
	install -vDm644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-APACHE
	install -vDm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-MIT
}
