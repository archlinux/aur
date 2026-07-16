pkgname=dsxtool
pkgver=1.7.6
pkgrel=1
pkgdesc="A modular, interactive Linux setup tool powered by fzf"
arch=('any')
url="https://github.com/csouzape/dsxtool"
license=('MIT')
depends=('bash' 'fzf' 'git' 'sudo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/csouzape/dsxtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c1dc0ac2ec83fae288873e0fa71ed82530ce42395862451ae6628947d9ab989')

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
