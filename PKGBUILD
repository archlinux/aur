pkgname=dsxtool
pkgver=1.7.9
pkgrel=1
pkgdesc="A modular, interactive Linux setup tool powered by fzf"
arch=('any')
url="https://github.com/csouzape/dsxtool"
license=('MIT')
depends=('bash' 'fzf' 'git' 'sudo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/csouzape/dsxtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd5828db52758f893f40ebfb4612b03bd19c2d8e02362033a2e28378a7050050')

package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/usr/share/dsxtool"
    cp -r core modules install.sh README.md "$pkgdir/usr/share/dsxtool/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/dsxtool" <<'LAUNCHER'
#!/usr/bin/env bash
exec bash "/usr/share/dsxtool/install.sh" "$@"
LAUNCHER
    chmod 755 "$pkgdir/usr/bin/dsxtool"
}
