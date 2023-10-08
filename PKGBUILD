# Maintainer: Jadelynn Cheatum <cheatumj@proton.me>
pkgname=rmup
pkgver=0.4.2
pkgrel=1
pkgdesc="A TUI music player written in Rust"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.com/jcheatum/rmup"
license=('MPL2')
groups=()
depends=(glibc gcc-libs alsa-lib)
makedepends=(git cargo)
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://gitlab.com/jcheatum/rmup.git")
noextract=()
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
    install -Dm755 'target/release/rmup' "$pkgdir/usr/bin/rmup"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
