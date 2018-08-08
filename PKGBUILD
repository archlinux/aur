# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>

pkgname=eusw
pkgver=1.3.1.22
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="http://iit.com.ua"
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
    _src_md5sum='6715a8e3e89ac70fa08b012efa1f14d8'
    _srcuri_filename='euswi.deb'
    _src_filename="eusw_${pkgver}_i386.deb"
else
    _src_md5sum='8f27bf27e64bebd5a3739484ac4ddbb1'
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
