# Maintainer: Mark Vainomaa <ue.meeksorkim@meeksorkim>

pkgname=jsonrpc_server-git
pkgver=0.0.1.r0.g6fff5d5
pkgrel=1
pkgdesc="JSON-RPC 2.0 request handler library written in C11 based on Jansson"
arch=('x86_64')
url=https://github.com/mikroskeem/jsonrpc_server
license=('MIT')
depends=('jansson')
makedepends=('meson' 'ninja')
source=('git+https://github.com/mikroskeem/jsonrpc_server.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"

    # Remove previous build directory
    if [ -d "build" ]; then
        rm -rf build
    fi

    meson \
        --prefix /usr \
        ./ \
        ./build

    ninja -C build
}

package() {
    cd "${pkgname}"

    DESTDIR="${pkgdir}" ninja -C build install
    install -D -m 644 LICENSE "${pkgdir}"/usr/share/licenses/jsonrpc_server/LICENSE
}
