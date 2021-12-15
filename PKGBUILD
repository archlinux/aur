# Maintainer: Kookies <kookies@tutamail.com>
_name=nxtik
pkgname=$_name-git
pkgver=v1.0.r0.gb01fa60
pkgrel=1
pkgdesc="A library and tool for parsing and outputting information about Switch tik files (git)"
arch=(x86_64)
url="https://github.com/jam1garner/$_name"
license=('unknown')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=($_name)
conflicts=($_name)
source=("$_name::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_name"
	cargo build --release
}

package() {
	cd "$srcdir/$_name"
	install -D "target/release/$_name" "$pkgdir/usr/bin/$_name"
}
