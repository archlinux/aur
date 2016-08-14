pkgname=ruma-git
_pkgname=ruma
pkgdesc=" A Matrix homeserver client API written in Rust."
pkgrel=1
pkgver=0.1.0.159
arch=('i686' 'x86_64')
conflicts=("ruma")
provides=("ruma")
url="https://github.com/ruma/ruma"
license=('GPL-3.0')
depends=('rocksdb')
makedepends=('rust' 'cargo' 'git' 'python-pytoml')
source=('git://github.com/ruma/ruma.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(python -c "print(__import__('pytoml').loads('\n'.join(open('Cargo.toml').read().splitlines()[:12]))['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo build --release --no-default-features
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/ruma" "$pkgdir/usr/bin/ruma"
}
