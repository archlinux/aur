# Maintainer: devome <evinedeng@hotmail.com>

pkgname=flexget-webui
pkgver=2.0.29
pkgrel=1
pkgdesc="The FlexGet Web UI"
arch=("any")
url="https://github.com/Flexget/webui"
license=("MIT")
makedepends=("yarn")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('28151e8574844b5ab826ebbb5200b3171bafe5a91e4d908ea50e0f118946058e')
options=("!strip")

build() {
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "webui-${pkgver}"
    yarn install --frozen-lockfile
    yarn build
    find dist -iname "*.js.map" -o -iname "*.css.map" | xargs rm -rf
}

package() {
    cd "webui-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find dist -type f | xargs -I {} install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/v${pkgver%%.*}/"{}
}
