# Maintainer: Scott Shumate <scott(at)shumatech(dot)com>
pkgname=gorom
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage ROM sets and torrents for game emulators such as MAME."
arch=(x86_64)
url="https://github.com/shumatech/gorom"
license=('GPL')
depends=('libsciter-gtk')
makedepends=('go' 'upx')
options=(!strip)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
        gorom.desktop)
sha256sums=('8b623b916914519822621361aea81c39c126a86126c4e02a68eae7406527232f'
            'a04779995686f47e77b04ce5f131f7d530746c9a4d3c42f9011d70f1e381fbcb')

build() {
    cd ${pkgname}-${pkgver}
    make upx VERSION=v${pkgver}
}

package() {
    cd ${pkgname}-${pkgver}
    install -TDm644 "${srcdir}/gorom.desktop" "${pkgdir}/usr/share/applications/gorom.desktop"
    install -TDm644 gui/res/images/gorom.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gorom.svg"
    install -Dm755 -t "${pkgdir}/usr/bin" bin/gorom bin/goromui
}
