# Maintainer: Jaume Delclòs (cosarara) <cosarara97@gmail.com>
pkgname=weeb-rs-git
pkgver=r39.def4e05
pkgrel=1
pkgdesc="A library manager for anime and series - rust rewrite"
arch=("i686" "x86_64")
url="https://github.com/cosarara97/fucking-weeb-rs"
license=('GPL3')
depends=('gtk3' 'openssl')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname%-git}" weeb)
conflicts=("${pkgname%-git}" weeb)
source=('weeb-rs::git+https://github.com/cosarara97/fucking-weeb-rs.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 target/release/fucking-weeb-rs "$pkgdir/usr/bin/weeb"
}
