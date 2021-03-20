# Maintainer: Qingxu <me@linioi.com>

pkgname=yesplaymusic
pkgver=0.3.5
pkgrel=1
pkgdesc="A third party music application for Netease Music"
arch=("x86_64")
url="https://github.com/qier222/YesPlayMusic"
license=("MIT")
depends=(
    "gtk3"
    "nss"
)
optdepends=(
    'c-ares'
    'ffmpeg'
    'http-parser'
    'libevent'
    'libvpx'
    'libxslt'
    'minizip'
    're2'
    'snappy'
    'libnotify'
    'libappindicator-gtk3'
)
source=(
    "YesPlayMusic-${pkgver}.pacman::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/YesPlayMusic-${pkgver}.pacman"
)
md5sums=('b6b46998785fe4e6d8250a536d174e66')

package() {
    cd ${srcdir}
    mv YesPlayMusic-${pkgver}.pacman YesPlayMusic-${pkgver}.pkg.tar.zst
    tar -I zstd -xvf YesPlayMusic-${pkgver}.pkg.tar.zst -C ${pkgdir}

    # remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}

post_install() {
        :
    #!/bin/bash

    # Link to the binary
    ln -sf '/opt/YesPlayMusic/yesplaymusic' '/usr/bin/yesplaymusic'

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/YesPlayMusic/chrome-sandbox' || true

    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true

}

post_remove() {
        :
    #!/bin/bash

    # Delete the link to the binary
    rm -f '/usr/bin/yesplaymusic'

}
