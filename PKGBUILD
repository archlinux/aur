# Maintainer: David Campbell <dcampbell24@gmail.com>

# Zero-Clause BSD
# ===============

# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.

# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
# FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
# DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
# AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

pkgname=hnefatafl-copenhagen
pkgver=4.5.0
pkgrel=7
pkgdesc="Copenhagen Hnefatafl client."
url="https://hnefatafl.org"
license=("MIT OR Apache-2.0")
arch=("x86_64")
provides=("hnefatafl-copenhagen")
conflicts=("hnefatafl-copenhagen")
depends=("glibc" "gcc-libs" "hicolor-icon-theme" "alsa-lib")
makedepends=("base-devel" "clang" "llvm" "mold" "rustup")
source=("https://github.com/dcampbell24/hnefatafl/archive/refs/tags/v$pkgver--ai.tar.gz")
sha256sums=("44b2213594957d81653f5b1ed73300169ba2d5f4359764d61a4c4ab4967c2c4b")

build() {
    tar -xvzf v$pkgver--ai.tar.gz
    cd "hnefatafl-$pkgver-ai"

    cargo build --release --features client --no-default-features

    ./target/release/hnefatafl-ai --man --username ""
    ./target/release/hnefatafl-client --man
    ./target/release/hnefatafl-server --man
    ./target/release/hnefatafl-text-protocol --man

    gzip --no-name --best hnefatafl-ai.1
    gzip --no-name --best hnefatafl-server.1
    gzip --no-name --best hnefatafl-text-protocol.1
    gzip --no-name --best hnefatafl-client.1
}

package() {
    cd "hnefatafl-$pkgver-ai"
    install -Dm755 "target/release/hnefatafl-ai" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-client" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-server" -t "$pkgdir/usr/bin"
    install -Dm755 "target/release/hnefatafl-text-protocol" -t "$pkgdir/usr/bin"
    install -Dm644 "packages/hnefatafl-ai-attacker.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "packages/hnefatafl-ai-defender.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "icons/king_16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_22x22.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_42x42.png" "$pkgdir/usr/share/icons/hicolor/42x42/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "icons/king_256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.hnefatafl.hnefatafl_client.png"
    install -Dm644 "hnefatafl-ai.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-ai.1.gz"
    install -Dm644 "hnefatafl-client.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-client.1.gz"
    install -Dm644 "hnefatafl-server.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-server.1.gz"
    install -Dm644 "hnefatafl-text-protocol.1.gz" "$pkgdir/usr/share/man/man1/hnefatafl-text-protocol.1.gz"
    install -Dm644 "packages/hnefatafl-client.desktop" "$pkgdir/usr/share/applications/hnefatafl-client.desktop"
}
