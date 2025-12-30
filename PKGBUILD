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
source=("$pkgname-$pkgver.tar.gz::https://release-assets.githubusercontent.com/github-production-release-asset/1045288007/6585ba31-1520-4e17-820a-b08a5d3248a3?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-12-30T10%3A57%3A11Z&rscd=attachment%3B+filename%3DLumen-linux-x64-v$pkgver.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-12-30T09%3A56%3A18Z&ske=2025-12-30T10%3A57%3A11Z&sks=b&skv=2018-11-09&sig=ZfWZt7qp%2F6azWXo7EwMg0Q9l%2B%2FdhteJ85Mpc1C4rjxk%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2NzA5MDE0NiwibmJmIjoxNzY3MDg5ODQ2LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.etaswKOpVlT5c-OiXSTnkDGX2Sjkuyqu-XlohuPsvvw&response-content-disposition=attachment%3B%20filename%3DLumen-linux-x64-v$pkgver.tar.gz&response-content-type=application%2Foctet-stream"

        "lumen-journal.desktop"
        "lumen-journal.png"
        "lumen-journal.appdata.xml"
        "lumen-journal.1"
        "lumen-journal.bash"
        "_lumen-journal"
        "lumen-journal.fish")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
