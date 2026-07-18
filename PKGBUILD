pkgname=dsxtool
pkgver=1.7.8
pkgrel=1
pkgdesc="A modular, interactive Linux setup tool powered by fzf"
arch=('any')
url="https://github.com/csouzape/dsxtool"
license=('MIT')
depends=('bash' 'fzf' 'git' 'sudo')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/csouzape/dsxtool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('946e6d42e5032ab7ef042f2f31906df114f30929a3f91cce528a0d69e49fa0a3')

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
