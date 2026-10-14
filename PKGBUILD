# Maintainer: czyt <czytcn@gmail.com>
pkgname=magpie-cli-bin
pkgver=0.1.1233
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
sha256sums_x86_64=('74d392e42298e2409a1b11cb09a833f7fe8c7a5cac487d1781c6f751c7b7ab8d')
sha256sums_aarch64=('0f2a1aa354454590c8601586ce486a5f223a726625aabfe3dbda63f2290c07fd')

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
