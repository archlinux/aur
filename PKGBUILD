# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=1.0a
pkgrel=2
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3 libxcb)
makedepends=(rust-nightly)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c2faa685f3642bfd0f3a93635d2afefe2429e8f76b798b84e0ba8e4ad7cb0a6b')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --all-features
}

build() {
    cd "$_pkgname-$pkgver"
    cargo build --offline --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
	install -Dm755 target/release/MFEK$_pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
