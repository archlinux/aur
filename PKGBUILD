# Maintainer: Qingxu <me@linioi.com>

pkgname=yesplaymusic
pkgver=0.3.9
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
md5sums=('530cc211e7b8831c058aee6143c35379')

package() {

    cd ${srcdir}
    tar -xvf YesPlayMusic-${pkgver}.pacman -C ${pkgdir}

    # remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL

}

post_install() {

    # Link to the binary
    ln -sf '/opt/YesPlayMusic/yesplaymusic' '/usr/bin/yesplaymusic'

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 '/opt/YesPlayMusic/chrome-sandbox' || true

    update-mime-database /usr/share/mime || true
    update-desktop-database /usr/share/applications || true

}

post_remove() {

    rm -f '/usr/bin/yesplaymusic'

}
