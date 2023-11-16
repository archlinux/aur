# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

pkgname=lua-async
pkgver=0.2.1
pkgrel=1
pkgdesc="Utilities for callback-style asynchronous execution in Lua"
arch=('any')
url="https://github.com/sclu1034/async.lua"
license=('GPL3')
depends=('lua')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0978346f0e1f1d7683b43de07948fb9aebf418e405e4bf1f5d1de7fbba245a5c')

build() {
    cd ${srcdir}/async.lua-${pkgver}
    luarocks make --deps-mode=none --pack-binary-rock ./rocks/async.lua-${pkgver}-1.rockspec
}

package() {
    cd ${srcdir}/async.lua-${pkgver}
    luarocks install --tree=${pkgdir}/usr --deps-mode=none --no-manifest ./*.rock
    install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
