pkgname=scaffolding-git
pkgdesc="A new kind of terminal"
pkgrel=1
pkgver=0.1.0.97
arch=('i686' 'x86_64')
conflicts=("scaffolding")
provides=("scaffolding")
url="https://github.com/withoutboats/notty"
license=('AGPL-3.0')
depends=('gtk3')
makedepends=('rust' 'cargo' 'git' 'python-pytoml')
source=('git://github.com/withoutboats/notty.git')
sha256sums=('SKIP')

pkgver() {
	cd notty/scaffolding
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd notty/scaffolding
	cargo build --release
}

check() {
	cd notty/scaffolding
	cargo test --release
}

package() {
	cd notty/scaffolding
	rm echotest/ -r
	export PATH="$PATH:$pkgdir/usr/bin"
	cargo install --bin scaffolding-terminal --root "$pkgdir/usr"
	rm "$pkgdir/usr/.crates.toml"
}
