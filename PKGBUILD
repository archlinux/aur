# Maintainer: Your Name <youremail@example.com>
pkgname=leothecat
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal cat companion named Leo with 25+ moods, achievements, and interactive commands!"
arch=('x86_64' 'aarch64')
url="https://github.com/homekhaneh8-art/leothecat"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'git')
optdepends=(
    'fish: for fish shell completions'
    'zsh: for zsh shell completions'
    'bash: for bash completions'
)
provides=('leothecat')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/homekhaneh8-art/leothecat/archive/v$pkgver.tar.gz")
sha256sums=('df8210ddceb3ab4f15d9b3d8e28257a5ee5e6eaa405f0ac03dc7c1df4e19f2a0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "$srcdir/target/release/leothecat" "$pkgdir/usr/bin/leothecat"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
