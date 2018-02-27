# Maintainer: aimileus <me at aimileus dot nl>
pkgname=rsign-git
_pkgname=rsign
pkgver=r47.8a9d852
pkgrel=1
pkgdesc="Rust implementation of minisign (development version)."
arch=('x86_64')
url="https://bitbucket.org/danielrangel/rsign"
license=('MIT')
depends=(
  'libsodium'
  'gcc-libs'
)
makedepends=(
  'git'
  'rust'
)
source=("git+https://bitbucket.org/danielrangel/rsign.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	cargo install --root "$pkgdir/usr"	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/rsign-git/LICENSE"

	rm "$pkgdir/usr/.crates.toml"
}
