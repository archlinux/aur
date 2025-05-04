# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
pkgname="${_bin}-rs"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=1.7.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/iliazeus/iso2god-rs'
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
_src="${pkgname}-${pkgver}"
source=("${_src}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f3de503e63d8ea0c41bb33fe4b540362c0f8bc498fb7ecbad2cb40b17f306d5100754cf80b0a375d7d3bb9c73cbe262cceaf9f0220d651b265bb317fbd2360a6')

prepare() {
    cd "$_src"
    cargo fetch --locked
}

build() {
    cd "$_src"
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${_src}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_bin}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
