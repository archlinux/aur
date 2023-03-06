# Maintainer: Gaurav Atreya <allmanpride at gmail dot com>
pkgname=nameit
pkgver=0.1.2
pkgrel=1
pkgdesc="Tool to run commands based on a templates"
arch=('x86_64')
url="https://github.com/Atreyagaurav/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/Atreyagaurav/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname}"
    git checkout "tags/$(git describe --tags --abbrev=0)"
}


build() {
	cd "$srcdir/${pkgname}"
	cargo build --release
}

package() {
    cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/bin"
    cp "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
