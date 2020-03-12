# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=navi-git
pkgver=r238.8d0c82c
pkgrel=12
pkgdesc='An interactive cheatsheet tool for the command-line.'
arch=('any')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=('fzf')
makedepends=('git' 'make' 'rustup')
provides=('navi')
conflicts=('navi')
source=("${pkgname}::git+${url}"
        navi.sh)
md5sums=('SKIP'
        43cf44f1cd5b9a7bb8f247735a59ba91)
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    rustup update
    rustup install stable
    cargo +stable build --release --locked
}

package() {
    cd "${pkgname}"

    mkdir -p "${pkgdir}/usr/bin/"
    cp ./target/release/navi "${pkgdir}/usr/bin/navi"

    mkdir -p "${pkgdir}/${HOME}/.navi"
    cp -r ./cheats "${pkgdir}/${HOME}/.navi/cheats"
    cp -r ./shell "${pkgdir}/${HOME}/.navi/shell"
}
