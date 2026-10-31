# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=code-buster
pkgver=0.12.0
pkgrel=1
_tag=v$pkgver
_srcdir="code-buster-$pkgver"
pkgdesc="Deterministic, offline static analysis for repository structure, dependencies, dead code, duplication, complexity, security, and maintainability across 18 languages"
arch=('x86_64')
url="https://toolbunker.dev/codebuster/"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tool-bunker/code-buster/archive/refs/tags/$_tag.tar.gz")
sha256sums=('192a60f2a6e5bb026bcf8a073c8e60ed1a352c9c2eb864eecc54acac8de028d9')

build() {
	cd "$_srcdir"
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"
	cargo build --release --locked
}

package() {
	cd "$_srcdir"
	# el ejecutable upstream se llama "cb"; el catálogo de reglas ya va compilado dentro
	install -Dm755 target/release/cb "$pkgdir/usr/bin/cb"
	ln -s cb "$pkgdir/usr/bin/code-buster"
	ln -s cb "$pkgdir/usr/bin/cbuster"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
