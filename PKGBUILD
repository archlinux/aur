# Maintainer: Max Struebing <mxstrbng@gmail.com>

pkgname=dotenv-linter-git
pkgver=1.1.1
pkgrel=1
pkgdesc="Linter for .env files. Written in Rust"
arch=(any)
url="https://github.com/dotenv-linter/dotenv-linter"
license=('MIT')
depends=()
makedepends=('git' 'cargo')
source=("git+$url")
md5sums=('SKIP')
provides=('dotenv-linter')

build() {
    cd "$srcdir/dotenv-linter" || exit
    git clone https://github.com/dotenv-linter/dotenv-linter
    cd dotenv-linter || exit
    cargo build --release

}

package() {
    cd "$srcdir/dotenv-linter/dotenv-linter/target/release" || exit
    install -Dm755 dotenv-linter "$pkgdir/usr/bin/dotenv-linter"
    cd "$srcdir/dotenv-linter/dotenv-linter" || exit
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dotenv-linter/LICENSE"
}
