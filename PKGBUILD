# Maintainer: Katie Varkony (tristanandlucky@gmail.com)

pkgname=nbtworkbench-git
pkgver=1.6.0
pkgrel=1
pkgdesc='A modern NBT Editor written in Rust.'
url='https://github.com/RealRTTV/nbtworkbench'
license=('MPL-2.0')
makedepends=('cargo', 'git')
depends=()
arch=('x86_64')
source=("git+$url")
b2sums=('SKIP')

prepare() {
    cd nbtworkbench
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd nbtworkbench
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo +nightly build --frozen --release --all-features
}

check() {
    cd nbtworkbench
    export RUSTUP_TOOLCHAIN=nightly
    cargo +nightly test --frozen --all-features
}

package() {
    cd nbtworkbench
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nbtworkbench"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

