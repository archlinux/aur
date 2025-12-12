pkgname=rutoken-connect
pkgver=6.1.1
pkgrel=1.2
pkgdesc='Rutoken Connect plugin for browser integration'
arch=('x86_64')
url='https://www.rutoken.ru/support/download/rutoken-connect/'
license=('custom:rutoken')
depends=('rutoken-pkcs11')
makedepends=('coreutils')
options=(!strip)

source_x86_64=("https://download.rutoken.ru/Rutoken_Connect/${pkgver}/Linux/x64/rtconnect-${pkgver}-1.x86_64.rpm")
sha256sums_x86_64=('052eac7a59ef23cf1480d199bee0b428a72af0a0f8dfc02da17c94d54f880853')

package() {

    files=(
    'ru.rutoken.rtconnect.chrome.json'
    'ru.rutoken.rtconnect.firefox.json'
    )
    for file in "${files[@]}"; do
    install -Dm644 "${srcdir}/opt/aktivco/rutokenconnect/${file}" "${pkgdir}/opt/aktivco/rutokenconnect/${file}"
    done
    install -Dm755 "${srcdir}/opt/aktivco/rutokenconnect/rtconnect" "${pkgdir}/opt/aktivco/rutokenconnect/rtconnect"

    install -Dm644 "${srcdir}/opt/aktivco/rutokenconnect/librtengine.so.3" "${pkgdir}/usr/lib/librtengine.so.3"

    install -Dm644 "${srcdir}/opt/google/chrome/extensions/acbchkahfmndkenefkcklofjmipghjjp.json" "${pkgdir}/opt/google/chrome/extensions/acbchkahfmndkenefkcklofjmipghjjp.json"

    mkdir -p "${pkgdir}/etc/chromium/native-messaging-hosts"
    mkdir -p "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"

    ln -s "/opt/aktivco/rutokenconnect/ru.rutoken.rtconnect.chrome.json" "${pkgdir}/etc/chromium/native-messaging-hosts/ru.rutoken.rtconnect.chrome.json"
    ln -s "/opt/aktivco/rutokenconnect/ru.rutoken.rtconnect.firefox.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/ru.rutoken.rtconnect.json"
    ln -s "/usr/lib/librtengine.so.3" "${pkgdir}/opt/aktivco/rutokenconnect/librtengine.so"
    ln -s "/usr/lib/librtpkcs11ecp.so" "${pkgdir}/opt/aktivco/rutokenconnect/librtpkcs11ecp.so"

    install -Dm644 "${srcdir}/usr/share/doc/rutokenconnect/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
