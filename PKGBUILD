# Maintainer: 128bitds <*hidden*>
pkgname=nsisbi-ext
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract files from NSIS installers created with the NSISBI format (i.e. can not be extracted with 7zip)."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/kmod-midori/unity-nsisbi-ext"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("${pkgname}-git::git+https://github.com/kmod-midori/unity-nsisbi-ext.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-git"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-git"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cd "$srcdir/$pkgname-git"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
