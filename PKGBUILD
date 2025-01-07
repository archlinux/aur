# Maintainer: NeptuneNepgear <ultra dot neppers at gmail dot com>
pkgname=cc3dsfs-bin
pkgver=1.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/Lorenzooone/cc3dsfs"
license=('MIT')

conflicts=('libftd3xx' 'cc3dsfs')
source=('cc3dsfs.desktop')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://github.com/Lorenzooone/cc3dsfs/releases/download/${pkgver}/cc3dsfs_linux_x86_64.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-arm64.zip::https://github.com/Lorenzooone/cc3dsfs/releases/download/${pkgver}/cc3dsfs_linux_arm64.zip")
sha512sums=('ea2def9251e9acc8488ba806cde5ef193c0e33feeadca892c4aac586b79e570df518a38f5fe32bfeefd4a9f1aa757940adfbbf020fa485846d0b64d50c865818')
sha512sums_x86_64=('SKIP')
sha512sums_aarch64=('SKIP')


package() {

    # select based on arch
    _pkg="${pkgname%-bin}_linux_x86_64"

    if [ "${CARCH}" = "aarch64" ]; then
        _pkg="${pkgname%-bin}_linux_arm64"
    fi

    cd ${_pkg}

    # install app related files
    install -Dm0755 -t "$pkgdir/usr/bin/" "cc3dsfs"
    install -Dm0755 -t "$pkgdir/usr/share/applications/" "../../cc3dsfs.desktop"

    # install udev rules
    install -D -m755 "${srcdir}/${_pkg}"/50-ftd2xx.rules "${pkgdir}"/etc/udev/rules.d/50-ftd2xx.rules
    install -D -m755 "${srcdir}/${_pkg}"/51-ftd2xx.rules "${pkgdir}"/etc/udev/rules.d/51-ftd2xx.rules
    install -D -m755 "${srcdir}/${_pkg}"/51-ftd3xx.rules "${pkgdir}"/etc/udev/rules.d/51-ftd3xx.rules
    install -D -m755 "${srcdir}/${_pkg}"/51-isnitro.rules "${pkgdir}"/etc/udev/rules.d/51-isnitro.rules
    install -D -m755 "${srcdir}/${_pkg}"/95-usb3dscapture.rules "${pkgdir}"/etc/udev/rules.d/95-usb3dscapture.rules
    install -D -m755 "${srcdir}/${_pkg}"/95-usbdscapture.rules "${pkgdir}"/etc/udev/rules.d/95-usbdscapture.rules
}