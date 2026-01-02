# Maintainer: gorciu <gorciuyt@gmail.com>

pkgname=ghla-lang
pkgver=2
pkgrel=1
pkgdesc="GHLA is a language level higher than Assembly"
arch=('x86_64')
url="https://github.com/gorciu-official/ghla"
license=('GPL-3.0-only')

makedepends=('make' 'gcc' 'binutils')
depends=('nasm')

source=("git+https://github.com/gorciu-official/ghla.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ghla"
    make
}

package() {
    cd "$srcdir/ghla"

    if [[ ! -f ghla.bin ]]; then
        echo "ERROR: ghla.bin not found after make!"
        exit 1
    fi

    install -Dm755 ghla.bin "$pkgdir/usr/bin/ghlac"
}

