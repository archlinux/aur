# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=dockeye-git
_pkgname=dockeye
pkgver=0.1.0.54.g4bfd0e9
pkgrel=1
epoch=
pkgdesc="GUI app to manage Docker"
arch=('x86_64')
url="https://github.com/vv9k/dockeye"
license=('GPLv3')
depends=('libxcb' 'gcc-libs')
makedepends=('cargo')
provides=('dockeye')
conflicts=('dockeye')
source=("${_pkgname}::git+https://github.com/vv9k/dockeye.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    cargo build --locked --release --all-features
}

check() {
	cd "$_pkgname"
    cargo test --release --all-features
}

package() {
	cd "$_pkgname"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/dockeye"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
