# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=cargo-loc
pkgver=0.1.2
pkgrel=1
pkgdesc="Counts the lines of code across your entire dependency tree in a Cargo project"
arch=(x86_64)
url="https://github.com/Shnatsel/cargo-loc"
license=('MIT OR Apache-2.0')
depends=(glibc gcc-libs)
makedepends=(cargo git)
options=(!debug !lto)
source=("git+https://github.com/Shnatsel/cargo-loc.git#commit=5a35f7b495d4743396db7d90ab7be80913a20538")
md5sums=('SKIP')
sha256sums=('SKIP')
b2sums=('SKIP')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "$pkgname"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"

    cargo build --frozen --release --all-features --target-dir target
}

package() {
    cd "$pkgname"

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-loc
}
