# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
_pkgbase="${_bin}-rs"
pkgname="${_pkgbase}-git"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=r65.06635a1
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/iliazeus/iso2god-rs'
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
source=("${_pkgbase}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgbase"
    cargo fetch --locked
}

build() {
    cd "$_pkgbase"
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_bin}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
