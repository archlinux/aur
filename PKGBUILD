# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>

pkgname=eusw
pkgver=1.3.1.17
pkgrel=1
pkgdesc="IIT End User CA-1. Sign (web)"
url="http://iit.com.ua"
arch=('i686' 'x86_64')

if [[ $CARCH = i686 ]]; then
    _src_md5sum='c3974ccd3658bf8ca7819a4eb6a21346';
    _src_filename='euswi.deb';
else
    _src_md5sum='5ad7abacc75f818c40a0d817a3a1bc73';
    _src_filename='euswi.64.deb';
fi

source=(
    "https://iit.com.ua/download/productfiles/${_src_filename}"
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
