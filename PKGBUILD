# Maintainer: clearclown <clearcleaclown@gmail.com>
pkgname=lala
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, lightweight text editor with GUI and CLI support for Markdown, HTML, Mermaid, and LaTeX"
arch=('x86_64' 'aarch64')
url="https://github.com/clearclown/lala"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clearclown/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e0891cce56f4b884b14b1ad2242b3849f256957e0849d94d48de636e567cca0')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # バイナリのインストール
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # ライセンスファイル
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    # ドキュメント
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
