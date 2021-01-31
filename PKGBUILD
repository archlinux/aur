# Maintainer: Keyboard-Slayer < dalcjor@libmail.eu >

pkgname="runas-git"
_pkgname="runas"
pkgver=0.1.0.1.gca17ee4
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/Keyboard-Slayer/runas"
pkgdesc="An alternative to sudo and doas written in Rust "
license=("GPL3")
makedepends=('rust' 'cargo' 'git')
provides=('runas')
conflicts=('runas')
source=("$_pkgname::git+https://github.com/Keyboard-Slayer/runas.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname/
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release
}

check() {
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
    cd $_pkgname

    mkdir -p "${pkgdir}/usr/bin"
    cp "target/release/runas" "${pkgdir}/usr/bin/"
    chmod 4755 "$pkgdir/usr/bin/runas"
}
