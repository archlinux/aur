pkgname=lumen-journal
pkgver=1.1.26
pkgrel=1
pkgdesc="Encrypted journal app built with Rust and Flutter"
arch=('x86_64')
url="https://github.com/crazygiscool/lumen"
license=('custom:CC-BY-NC-SA-4.0')
depends=()
makedepends=('cargo' 'git')
DLAGENTS=("https::/usr/bin/curl -L -A 'Mozilla/5.0' -o %o %u")
source=("$pkgname-$pkgver.tar.gz::https://raw.githubusercontent.com/Crazygiscool/Lumen/$pkgver/Lumen-linux-x64-v$pkgver.tar.gz"

        "lumen-journal.desktop"
        "lumen-journal.png"
        "lumen-journal.appdata.xml"
        "lumen-journal.1"
        "lumen-journal.bash"
        "_lumen-journal"
        "lumen-journal.fish")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed'
            '1356c3fc185336358b10fa1802bd0e4a80ea4beb5fc4f22f05b18d9acefb4337'
            'deb954f2a041cc527a6343199709fdbb5736e1e5e91870bd7ba5dd93d70b064d'
            '948750d9b6249bc98304a7b9b2fff450dfda4506e9195796dca1e85b03975c76'
            'a18cab49aa3ea8b38fe5de01b3cb0c219f656223c48ab0abbc3338d475acfbd8'
            '4e5076d0627acaccb0a6c97c3598b1d6828964e0d5fa69993dd4c5e11ab4c7b0'
            '73d7273bcac41fed13b9d32b6de9391ccef8a0b9a116b3dc4eb5e633388012c5'
            '3304b907591ff008495b31c8cbd4cd822ff0d797722e174532a475cbbf95463c')

build() {
    cd "$srcdir/Lumen-linux-x64-v$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/Lumen-linux-x64-v$pkgver"

    # Binary
    install -Dm755 target/release/lumen-journal "$pkgdir/usr/bin/lumen-journal"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop file
    install -Dm644 "$srcdir/lumen-journal.desktop" \
        "$pkgdir/usr/share/applications/lumen-journal.desktop"

    # Icon
    install -Dm644 "$srcdir/lumen-journal.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lumen-journal.png"

    # AppStream metadata
    install -Dm644 "$srcdir/lumen-journal.appdata.xml" \
        "$pkgdir/usr/share/metainfo/lumen-journal.appdata.xml"

    # Man page
    install -Dm644 "$srcdir/lumen-journal.1" \
        "$pkgdir/usr/share/man/man1/lumen-journal.1"

    # Systemd user service
    install -Dm644 "$srcdir/lumen-journal.service" \
        "$pkgdir/usr/lib/systemd/user/lumen-journal.service"

    # Shell completions
    install -Dm644 "$srcdir/lumen-journal.bash" \
        "$pkgdir/usr/share/bash-completion/completions/lumen-journal"

    install -Dm644 "$srcdir/_lumen-journal" \
        "$pkgdir/usr/share/zsh/site-functions/_lumen-journal"

    install -Dm644 "$srcdir/lumen-journal.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/lumen-journal.fish"
}
