# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

_pkgname=fzy-lua
pkgname=lua-fzy-purelua
pkgver=1.0
pkgrel=1
pkgdesc="Pure lua fzf matching library (c implementation stripped)"
arch=('any')
url="https://github.com/swarn/fzy-lua"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflics=('lua-fzy')
provides=('lua-fzy')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "stripc.patch"
)
sha256sums=('1dcf5283b2f79927c8d8fec11bcf05623dc55b12a0de8c0413f8442d112109bc'
            'bddd8c7c675d273567ac650230139c371c2ba0f23aed3220fff5e41419a20a87')

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    patch < ../stripc.patch
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
