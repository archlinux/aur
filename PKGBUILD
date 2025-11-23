# Maintainer: snogard <snogardb at gmail dot com>

pkgname=r2modman-appimage
pkgver=3.2.11
pkgrel=1
pkgdesc='A simple and easy to use mod manager for several Unity games using Thunderstore.'
arch=('x86_64')
url=https://github.com/ebkr/r2modmanPlus
license=(MIT)

depends=(
    'fuse2'
    'hicolor-icon-theme'
    'zlib'
)

provides=(
    'r2modman'
)

source=(
    "${url}/releases/download/v${pkgver}/r2modman-${pkgver}.AppImage"
    "r2modman.desktop"
)
sha256sums=('d4521847f311c927357e4c995161e99d0abde43f9b029e5dbb9e6264718c8d1d'
            '3e14229ab6f1d04da82dfb9c941de696f4936ad9694b3acf616fb04dcb6f54e9')
options=(!strip !debug)

prepare() {
    sed -i "s/{pkgversion}/${pkgver}/" ${srcdir}/r2modman.desktop

    chmod +x ${srcdir}/r2modman-${pkgver}.AppImage
    ${srcdir}/r2modman-${pkgver}.AppImage --appimage-extract
}

package() {
    install -Dm755 ${srcdir}/r2modman-${pkgver}.AppImage ${pkgdir}/opt/r2modman/r2modman.AppImage

    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/r2modman/r2modman.AppImage ${pkgdir}/usr/bin/r2modman

    install -dm755 ${pkgdir}/usr/share/applications/
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp --no-preserve=mode,ownership "${srcdir}/r2modman.desktop" "${pkgdir}/usr/share/applications/"
}
