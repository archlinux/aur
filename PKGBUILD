pkgname=dsxtool-git
pkgver=1.7.7.r0.gaf8d408
pkgrel=1
pkgdesc="A modular, interactive Linux setup tool powered by fzf (git version)"
arch=('any')
url="https://github.com/csouzape/dsxtool"
license=('MIT')
depends=('bash' 'fzf' 'git' 'sudo')
makedepends=('git')
provides=('dsxtool')
conflicts=('dsxtool')
source=("dsxtool::git+https://github.com/csouzape/dsxtool.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dsxtool"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/dsxtool"

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
