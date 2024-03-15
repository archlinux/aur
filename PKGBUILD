# Maintainer: Sandro-Alessio Gierens <sandro@gierens.de>
pkgname=wikijs-rs
pkgver=0.2.1
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="CLI client for Wiki.js written in Rust."
url="https://github.com/gierens/wikijs-rs"
license=('AGPL-3.0')

build() {
    return 0
}

pkgver() {
    cargo search wikijs | grep "^wikijs " | awk '{print $3}' | tr -d '"'
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" wikijs --features=cli
    rm -f "$pkgdir"/.crates.toml
    rm -f "$pkgdir"/.crates2.json
    mkdir -p "$pkgdir"/usr
    mv "$pkgdir"/bin "$pkgdir"/usr/
}
