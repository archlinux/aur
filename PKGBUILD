pkgname=not-perf-git
_pkgname=not-perf
pkgdesc="A sampling CPU profiler for Linux"
pkgrel=1
pkgver=0.1.0.310
arch=('i686' 'x86_64')
conflicts=("not-perf")
provides=("not-perf")
url="https://github.com/koute/not-perf"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/koute/not-perf")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname/cli
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/nperf" "$pkgdir/usr/bin/nperf"
}
