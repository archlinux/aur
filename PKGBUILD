# Maintainer: czyt <czytcn@gmail.com>
pkgname=magpie-cli-bin
pkgver=0.1.3190
pkgrel=1
pkgdesc="Terminal build of magpie: pick every AI coding agent's model without GUI dependencies"
arch=('x86_64' 'aarch64')
url="https://usemagpie.ai"
license=('MIT')
# Static build: no webkit2gtk/gtk3 needed. It installs as `magpie-cli`, so it
# can be used alongside the desktop package (magpie-bin).
provides=('magpie-cli')
conflicts=('magpie-cli')
options=('!strip' '!debug')

source=("magpie-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetone/magpie/v${pkgver}/LICENSE")
source_x86_64=("magpie-cli-${pkgver}-amd64::https://github.com/yetone/magpie-releases/releases/download/v${pkgver}/magpie-cli-linux-amd64")
source_aarch64=("magpie-cli-${pkgver}-arm64::https://github.com/yetone/magpie-releases/releases/download/v${pkgver}/magpie-cli-linux-arm64")
sha256sums=('79d2c8444715d4bc453ec4f8a0aaf2051a4c1ee5ac08f5bd2e5848aef87c7572')
sha256sums_x86_64=('6b2cef811ca741852c52ea25cf39533b8cb9a56ce49165e76ce79d0c01b9c1f7')
sha256sums_aarch64=('421ee54fa588b870a597d6295bdbf38291b1f34f5ae3cb76ee9fb4af96920242')

package() {
    local _suffix
    case "$CARCH" in
        x86_64)  _suffix=amd64 ;;
        aarch64) _suffix=arm64 ;;
    esac

    install -Dm755 "${srcdir}/magpie-cli-${pkgver}-${_suffix}" "${pkgdir}/usr/bin/magpie-cli"
    install -Dm644 "${srcdir}/magpie-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/magpie-cli-bin/LICENSE"
}
