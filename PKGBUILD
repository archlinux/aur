# Maintainer: Scott Shumate <scott(at)shumatech(dot)com>
pkgname=gorom
pkgver=0.1.1
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
sha256sums=('332a6073bf9eec12d26240cb45dc90716165a1116f6c32d1654155a666956ce8'
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
