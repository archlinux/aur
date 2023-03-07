# Maintainer: Gaurav Atreya <allmanpride at gmail dot com>
pkgname=nameit-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Tool to run commands based on a templates"
arch=('x86_64')
url="https://github.com/Atreyagaurav/${pkgname%-git}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/Atreyagaurav/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git checkout "tags/$(git describe --tags --abbrev=0)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
    cp "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
