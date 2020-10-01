# Maintainer: Petr Šťastný <aur@soptik.tech>
pkgname=desed-git
pkgver=1.2.0.7ae641b
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/desed"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('desed')
source=("$pkgname::git+https://github.com/soptikha2/desed.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    latest_version_published=$(git tag | tail -1 | sed 's/^v//')
    latest_commit_hash=$(git log -1 --format="%h")
    echo "$latest_version_published.$latest_commit_hash"
}

build() {
    cd "$pkgname"

    cargo build --release
}

package() {
    cd "$pkgname"

    install -D "target/release/desed" -t "$pkgdir/usr/bin"
    install "desed.1" -t "$(manpath | cut -d':' -f1)/man1"
    mandb
}
