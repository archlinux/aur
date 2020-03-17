# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=navi-git
pkgver=r305.cc8982f
pkgrel=1
pkgdesc='An interactive cheatsheet tool for the command-line.'
arch=('any')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=('fzf')
makedepends=('git' 'make' 'rustup')
provides=('navi')
conflicts=('navi')
install='navi.install'
source=("${pkgname}::git+${url}"
        navi.install)
md5sums=('SKIP'
        7c127df30b4800c8a340166cb9cb2066)
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cargo +stable build --release --locked --all-features
}

package() {
    cd "${pkgname}"
    install -Dm755 "./target/release/navi" "${pkgdir}/usr/bin/navi"
}
