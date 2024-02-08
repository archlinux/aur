# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

_pkgname=fzy-lua
pkgname=lua-fzy
pkgver=1.0
pkgrel=1
pkgdesc="Lua fzf matching library"
arch=('x86_64')
url="https://github.com/swarn/fzy-lua"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=('lua-fzy-purelua')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('1dcf5283b2f79927c8d8fec11bcf05623dc55b12a0de8c0413f8442d112109bc')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    luarocks make --deps-mode=none --pack-binary-rock ./fzy-scm-1.rockspec
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    luarocks install --tree=${pkgdir}/usr --deps-mode=none --no-manifest ./*.rock
    install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
