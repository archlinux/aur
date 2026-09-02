pkgname=moli-git
pkgver=1.1.1.525.g437a82ab
pkgrel=1
pkgdesc="Best headless browser for AI agents. Lite, Fast, High-Compatibility."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/lexmount/moli"
license=('MIT' 'APACHE')
depends=('libpng' 'brotli' 'bzip2' 'expat' 'freetype2' 'fontconfig')
makedepends=('cargo' 'cmake' 'git')
optdepends=()
provides=('moli')
conflicts=('moli')
source=($pkgname::git+https://github.com/lexmount/moli)
sha256sums=('SKIP')
options=(!lto)

pkgver() {
	cd $pkgname/moli
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname/moli
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/moli" "$pkgdir/usr/bin/moli"
}
