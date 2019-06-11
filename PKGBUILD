# Maintainer: H.D. Lin <oidiotlin@gmail.com>
pkgname=linggle-git
pkgver=0.1.1.r0.g7f81bc5
pkgrel=1
url="https://github.com/OIdiotLin/linggle-rust"
_gitname="linggle-rust"
_appname="linggle"
license=('MIT')
source=('git+https://github.com/OIdiotLin/linggle-rust.git')
makedepends=('rust' 'cargo' 'git')
arch=('x86_64')
pkgdesc="A CLI tool of Linggle implemented in rust."
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --long --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_gitname
    cargo build --release
}

check() {
    cd $_gitname
    cargo test --release --jobs 1
}

package() {
    cd $_gitname
    install -Dm 755 target/release/$_appname -t "${pkgdir}/usr/bin"
}
