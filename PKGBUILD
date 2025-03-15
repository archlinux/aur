# Maintainer: Antônio Breno <coisasaletaorias@gmail.com>
pkgname=modu-git
pkgver=v0.6.0.28.g90c8843
pkgrel=1
pkgdesc="Modu is a simple and fast interpreted programming language."
arch=('x86_64')
url="https://github.com/Cyteon/modu"
license=('MIT')
depends=('glibc' 'bzip2' 'zlib' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('modu')
conflicts=('modu')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/modu"
    git describe --long --tags --always | sed 's/-/./g'
}

build() {
    cd "$srcdir/modu/lang"
    cargo build --release
}

package() {
    cd "$srcdir/modu"
    install -Dm755 "lang/target/release/modu" "$pkgdir/usr/bin/modu"
}
