# Maintainer: Abraham Toriz <categulario at gmail dot com>
pkgname=tiempo-git
pkgver=1.3.2
pkgrel=1
pkgdesc='A command line time tracking application'
arch=('i686' 'x86_64')
url='https://gitlab.com/categulario/tiempo-rs'
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
makedepends=('cargo' 'git')
provides=('tiempo')
conflicts=('tiempo')
source=('tiempo-git::git+https://gitlab.com/categulario/tiempo-rs')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/t "$pkgdir"/usr/bin/t

    install -Dm644 README.md "$pkgdir"/usr/share/doc/tiempo/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/doc/tiempo/LICENSE
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/tiempo/CHANGELOG.md
}
