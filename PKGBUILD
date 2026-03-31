# Maintainer: Kevin McConnell
pkgname=once-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='CLI/TUI for installing and managing self-hosted web applications'
arch=('x86_64' 'aarch64')
url='https://github.com/basecamp/once'
license=('MIT')
depends=('docker')
provides=('once')
conflicts=('once')
install=once.install
options=('!strip')

_arch_x86_64=amd64
_arch_aarch64=arm64

source_x86_64=("once-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/once-linux-${_arch_x86_64}")
source_aarch64=("once-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/once-linux-${_arch_aarch64}")
source=("MIT-LICENSE-${pkgver}::https://raw.githubusercontent.com/basecamp/once/v${pkgver}/MIT-LICENSE"
        "once-background.service")

sha256sums=('fa0d1454375cbc7701bc13d916c3ae71e613b8ae718321641e678e09409393c4'
            'aa314fe79677eb5f120fcc3d4c42007a93ff7b1ef917382c0c1fdca5633ad46a')
sha256sums_x86_64=('ca23426d7ebe374ba1051bde1e3e16593f9ef1722b528f1429eddd3d33ace0ba')
sha256sums_aarch64=('4d2c6b9c1da8f73593c5b8c3076599e36c3c27fa3b7e424ccb0b75fc8876ba4f')

package() {
    install -Dm755 "once-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/once"
    install -Dm644 "MIT-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 once-background.service "${pkgdir}/usr/lib/systemd/system/once-background.service"
}
