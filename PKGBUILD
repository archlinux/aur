# Maintainer: H.D. Lin <oidiotlin@gmail.com>
pkgname=linggle-git
pkgver=r11.acf52f6
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
    # git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
