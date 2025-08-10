# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
pkgname="${_bin}-rs"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=1.8.0
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
b2sums=('32e7b77cf73e94cb24d24affd90006442d871ae793827d0baa97b2ace50d463e9d8c95e45bef11c9d45d5f9b30bc18e7f8bc17ae875f9580dca08dc06ebde8ae')

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
