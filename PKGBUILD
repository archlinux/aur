# Maintainer: Lucca Pellegrini <luccapellegrini@gmail.com>
pkgname=cloak-git
_pkgname=cloak
pkgver=0.1.0.r27.ge5f5ac3
pkgrel=1
pkgdesc='A Command Line OTP Authenticator application. (development version)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evansmurithi/cloak"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
conflicts=('cloak')
provides=('cloak')
source=("cloak::git+https://github.com/evansmurithi/cloak.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
