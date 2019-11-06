# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>

pkgname=eusw
pkgver=1.3.1.35
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="http://iit.com.ua"
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
    _src_md5sum='0f327f66fbcac2eb291f941d495bb6fe'
    _srcuri_filename='euswi.deb'
    _src_filename="eusw_${pkgver}_i386.deb"
else
    _src_md5sum='5abb7409c0e3b2a7f6529b1bc92efd21'
    _srcuri_filename='euswi.64.deb'
    _src_filename="eusw_${pkgver}_amd64.deb"
fi

source=(
    "${_src_filename}::https://iit.com.ua/download/productfiles/${_srcuri_filename}"
    'chrome.ua.com.iit.eusign.nmh.json'
    'mozilla.ua.com.iit.eusign.nmh.json'
)
md5sums=(
    "${_src_md5sum}"
    '64ed17e9ee22c1cbd05593131c492f33'
    '9d9c48e1078d3c58a3d82b216ff98cbc'
)

package() {
    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    install -Dm755 ${pkgdir}/opt/iit/eu/sw/npeuscp.so ${pkgdir}/usr/lib/mozilla/plugins/npeuscp.so

    # Installing native messaging host manifest (Chrome)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/opt/chrome/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Chromium)
    install -Dm644 ${srcdir}/chrome.ua.com.iit.eusign.nmh.json ${pkgdir}/etc/chromium/native-messaging-hosts/ua.com.iit.eusign.nmh.json
    # Installing native messaging host manifest (Mozilla)
    install -Dm644 ${srcdir}/mozilla.ua.com.iit.eusign.nmh.json ${pkgdir}/usr/lib/mozilla/native-messaging-hosts/ua.com.iit.eusign.nmh.json
}
