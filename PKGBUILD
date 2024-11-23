# Maintainer: ferk <ferkiwi @at gmail dot com>

pkgname=maze-tui
pkgver=324.88af24f
pkgrel=1
pkgdesc="Explore various maze building, solving, and measurement algorithms"
arch=('any')
url="http://github.com/agl-alexglopez/maze-tui"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
conflicts=()
provides=('maze-tui')
source=("git+https://github.com/agl-alexglopez/maze-tui")
md5sums=('SKIP')

_gitroot="maze-tui/maze_tui"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    cargo build --release
    install -Dm755 "$srcdir/$_gitroot/target/release/run_tui" "$pkgdir/usr/bin/maze-tui"
    install -Dm644 "$srcdir/$_gitroot/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
