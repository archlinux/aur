# Maintainer: John Combs <jscombs91 at gmail dot com>

pkgname=pololu-usb-avr-programmer-v2
pkgver='1.1.0'
pkgrel=1
pkgdesc='Pololu USB AVR Programmer v2 Configuration Utility'
arch=('x86_64')
url='https://www.pololu.com/docs/0J67'
license=('custom')

source=("https://www.pololu.com/file/0J1474/${pkgname}-${pkgver}-linux-x86.tar.xz"
        'pololu-usb-avr-programmer-v2.desktop')
sha256sums=('40b596a8b2b88da632f12b4a62c42ad3c44dc182b33ea10a0ac42cbb043cef48'
            '8b951b57121b05b815e2b9b67b712b1d43b3d2ad33e68891d9066c00671b11a6')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-linux-x86"

    install -d -m755 "${pkgdir}/opt/${pkgname}"
    install -Dm755 pavr2cmd pavr2gui "${pkgdir}/opt/${pkgname}"
    install -Dm644 *.ttf "${pkgdir}/opt/${pkgname}"

    install -d -m755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/pavr2cmd" "${pkgdir}/usr/bin/pavr2cmd"
    ln -s "/opt/${pkgname}/pavr2gui" "${pkgdir}/usr/bin/pavr2gui"

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -d -m755 "${pkgdir}/etc/udev/rules.d"
    install -Dm644 99-pololu.rules "${pkgdir}/etc/udev/rules.d/"

    install -d -m755 "$pkgdir/usr/share/applications"
    sed -i "s#Version=#Version=${pkgver}#g" "${srcdir}/pololu-usb-avr-programmer-v2.desktop"
    install -m644 "${srcdir}/pololu-usb-avr-programmer-v2.desktop" "${pkgdir}/usr/share/applications/"
}