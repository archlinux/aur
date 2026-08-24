# Maintainer: Muness Castle <muness@gmail.com>
# Contributor: Open Horizons <muness@openhorizons.me>
# AUR Package: unified-hifi-control-bin
# Pre-built binary package - downloads from GitHub releases
# Note: Web assets are embedded in the binary (ADR 002)

pkgname=unified-hifi-control-bin
_pkgname=unified-hifi-control
pkgver=3.6.0
pkgrel=1
pkgdesc="Hi-fi control bridge for Roon, LMS, HQPlayer, and hardware surfaces"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/open-horizon-labs/unified-hifi-control"
license=('PolyForm-Noncommercial-1.0.0')
options=('!debug' '!strip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"

# Architecture-specific binaries (renamed to 'binary' for $CARCH-agnostic reference)
source_x86_64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-x64")
source_aarch64=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-arm64")
source_armv7h=("binary::${url}/releases/download/v${pkgver}/unified-hifi-linux-armv7")

# Common files (no separate web assets - embedded in binary)
source=("${_pkgname}.service"
        "LICENSE.upstream::https://raw.githubusercontent.com/open-horizon-labs/unified-hifi-control/v${pkgver}/LICENSE")

# Updated automatically by the release workflow.
sha256sums=('7c8695dd38bb67c64ee8a428003b9f874f7718270d84597f7e8ed9ef061ddd73'
            'a01f522a8e48a40a0bb5027fc4c2673a033e4c09c305e5185681a79f0d51022e')
sha256sums_x86_64=('bf719ab2421c6ab3674ea7f6c6216cc7695b3cbc1ab4efcf3ab1b810643f6b70')
sha256sums_aarch64=('f55eba905d25aa06a98399d05a9e90ff911fbab04a80e643e2142526e61a8e47')
sha256sums_armv7h=('5219a2711825559d80ec33ece5004cf8b0eae73a29869c0e7d0ef58d9929cdba')

package() {
    cd "${srcdir}"

    # Install binary (includes embedded web assets)
    install -Dm755 binary "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd service
    install -Dm644 "${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    # Install license
    install -Dm644 LICENSE.upstream "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
