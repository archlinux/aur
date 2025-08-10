# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
pkgname="${_bin}-rs"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=1.8.1
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
b2sums=('dc993724f943889774562fdc4676a2abbbf5f0959d528a048be8c95cab80a2290324b21b4da0e3ad7a5e2aa9c18cdb05503acfa7a4099486951b84378b7c9b0f')

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
