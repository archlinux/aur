# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=llama-rs-git
pkgver=r32.90703d9
pkgrel=1
epoch=
pkgdesc="Run LLaMA inference on CPU, with Rust 🦀🚀🦙"
arch=(any)
url="https://github.com/setzer22/llama-rs"
license=('MIT')
groups=()
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=(llama-rs)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/setzer22/llama-rs.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd $srcdir/llama-rs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "llama-rs"
	cargo build --release
}

package() {
	cd llama-rs
	install -Dm755 target/release/llama-rs -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
}
