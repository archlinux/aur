# Maintainer: Lukas Krickl <lukas@krickl.dev>
pkgname=mji
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool for easily creating git commit messages using gitmoji"
url="https://github.com/unlink2/mji"
license=("MIT")
arch=("any")
makedepends=("cargo" "git")
source=("$pkgname::git+https://github.com/unlink2/mji")
sha256sums=('SKIP')
provides=("mji")

pkgver() {
    cd "$pkgname"
    (git describe --long --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release 
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

