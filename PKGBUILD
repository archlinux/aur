# Maintainer: Okabe Zero-Link <okabezerolink@gmail.org>

pkgname=emuera-tty
pkgver=0.1.1
pkgrel=1
pkgdesc='An Emuera (ERB engine) reimplementation in Rust for terminals'
url='https://github.com/astartes-gaming/emuera-tty'
license=(MIT)
makedepends=('cargo')
depends=()
arch=('any')
optdepends=('kitty: recommended terminal'
            'translate-shell: in-terminal MTL support')
source=(${pkgname}-${pkgver}.zip::"${url}/archive/refs/tags/v${pkgver}.zip")
b2sums=('1a33fb2bc7670ff04bc60c8ce65bf31af83e6f09972fdcd324ce15852ebf870218d710670d8f3a98df0fc007cdb180aa96d80c35eb02fa40156e6f4d36f87325')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
