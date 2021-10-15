# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=himalaya-git
_pkgname=himalaya
pkgver=r249.767eee9
pkgrel=2
pkgdesc="Minimalist CLI email client, written in Rust."
arch=('any')
url="https://github.com/soywod/himalaya"
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd "$_pkgname"
   RUSTUP_TOOLCHAIN=stable cargo test --frozen --all-features
}

package() {
   cd "$_pkgname"
   install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${_pkgname}"
   install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname}"
}
