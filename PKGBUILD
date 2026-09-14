# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=ccti
pkgver=0.1.1
pkgrel=1
pkgdesc="ComfyUI TUI: agentic image chat with inline terminal rendering"
arch=('x86_64')
url="https://github.com/corbet-labs/ccti"
license=('LicenseRef-FSL-1.1-ALv2')
depends=()
makedepends=('cargo' 'git')
provides=('ccti')
conflicts=('ccti-bin')
# ring (via rustls) ships C objects that rust-lld cannot link when the
# toolchain-wide -flto=auto is active; pure-Rust LTO is unaffected.
options=('!lto')
source=("$pkgname::git+https://github.com/corbet-labs/ccti.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --frozen --bin ccti
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/ccti" "$pkgdir/usr/bin/ccti"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
