# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=lamzu-cfg
pkgname="$_pkgname-git"
pkgver=r38.b0e5424
pkgrel=1
pkgdesc="Lamzu mouse configuration tool"
arch=('x86_64')
url="https://github.com/LeadSun/lamzu-cfg"
source=("git+$url")
license=(MIT)
options=(!lto)
sha256sums=('SKIP')

depends=(hidapi)
makedepends=(cargo git)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/lamzu-cfg "$pkgdir"/usr/bin/lamzu-cfg
}
