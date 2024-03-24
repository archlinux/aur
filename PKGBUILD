pkgname=onekey-bridge
pkgver=2.2.0
pkgrel=1
arch=('x86_64')
url="https://onekey.so/download/?client=bridge"
license=('custom')
# depends=('')
makedepends=('dpkg')
source=("https://web.onekey-asset.com/bridge/v2.2.0/onekey-bridge-2.2.0-amd64.deb")
sha256sums=('75b21054d95f7c527b833913a5b227c02305b8b29ea20a1a716717e8b98c132c')
pkgdesc="OneKey Bridge. Might be required to connect your hardware wallet"

prepare() {
    dpkg -x onekey-bridge-2.2.0-amd64.deb .

    tar -xvf data.tar.xz -C "$srcdir"
}

package() {
    install -Dm644 "${srcdir}/lib/udev/rules.d/50-onekey.rules" "${pkgdir}/usr/lib/udev/rules.d/50-onekey.rules"
    install -Dm755 "${srcdir}/usr/bin/onekeyd" "${pkgdir}/usr/bin/onekeyd"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/onekeyd.service" "${pkgdir}/usr/lib/systemd/system/onekeyd.service"
    install -Dm644 "${srcdir}/usr/share/doc/onekey-bridge/changelog.gz" "${pkgdir}/usr/share/doc/onekey-bridge/changelog.gz"
}

