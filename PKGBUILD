# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname="redox-games-git"
pkgver=r143.1e234c6
pkgrel=2
pkgdesc="Games for Redox OS (and Linux) in the terminal"
arch=('x86_64')
url='https://gitlab.redox-os.org/redox-os/games'
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    cargo build --release --locked
}

check() {
    cd $pkgname
    cargo test --release --locked
}

package() {
    cd $pkgname

    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 target/release/{baduk,commie,dem,flappy,h4xx3r,ice,minesweeper,reblox,redoku,rusthello,snake} "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/share/license"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
