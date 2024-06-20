pkgname=dnsi
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to investigate the DNS"
arch=('x86_64')
url="https://github.com/NLnetLabs/dnsi"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("https://github.com/NLnetLabs/dnsi/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
    install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "doc/dnsi.1" "doc/dnsi-query.1" "doc/dnsi-lookup.1"
}

md5sums=('8197a51f3e3b47147d41a70ff3c2a3ff')
sha1sums=('e2ca04194ef6cff358b580153747c94f8cabdadc')
sha256sums=('65dc7724838ec9405996f13f6aa1ba15a8f486d5abe56a46d06ed31bafd06c18')
sha384sums=('25c5f110c144c42ad6bcc8e223b3674aca8f5127ccd12cce3d09c0f8d5a746152bafaa9dc53f60ae4891e1144dadb6e5')
sha512sums=('6e3522a934877737f9b02ac20b0b810f5dad3236984d98071010d078d4d096fa6f41c2101d6e3a505fa9ccdbe82b6db845b24831376798b8fc1f556bbefcd2f6')
