# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

pkgname=lua-lgi-async-extra
pkgver=0.3.0
pkgrel=1
pkgdesc="Asynchronous high(er)-level API wrapper for LGI"
arch=('any')
url="https://github.com/sclu1034/lgi-async-extra"
license=('GPL3')
depends=(
    'lua'
    'lua-lgi'
    'lua-async'
)
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a66daad9e067813a03944eb09bc273510ae7f5fe152970824023fbc72281faaf')

build() {
    cd ${srcdir}/lgi-async-extra-${pkgver}
    luarocks make --deps-mode=none --pack-binary-rock ./rocks/lgi-async-extra-${pkgver}-1.rockspec
}

package() {
    cd ${srcdir}/lgi-async-extra-${pkgver}
    luarocks install --tree=${pkgdir}/usr --deps-mode=none --no-manifest ./*.rock
    install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
