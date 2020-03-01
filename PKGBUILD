# Maintainer: Wang Ruochen <wangkevin920@163.com>

pkgname=urlex-git
_pkgname=urlex
pkgver=0.1.0.r3.c04cd15
pkgrel=1
pkgdesc="Extract URL from stdin and print them to stdout"
arch=('x86_64')
url='https://github.com/weirane/urlex'
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
backup=()
options=()
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    _pkgver=$(grep '^version =' Cargo.toml | cut -d'"' -f2)
    echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "${_pkgname}"
    install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
