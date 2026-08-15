# Maintainer: Muness Castle <muness@gmail.com>
# Contributor: Open Horizons <muness@openhorizons.me>
# AUR Package: unified-hifi-control-bin
# Pre-built binary package - downloads from GitHub releases
# Note: Web assets are embedded in the binary (ADR 002)

pkgname=unified-hifi-control-bin
_pkgname=unified-hifi-control
pkgver=3.5.1
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
sha256sums_x86_64=('e00ecd5b86cbcf1fbabde267192218135d980765f48d9e56b127a392a2f2bb37')
sha256sums_aarch64=('c7bb790f2424d07ba6f358fc2fcc9e6ab6414de6d949206f9732223bb30ee9f4')
sha256sums_armv7h=('f80e211d5ee42569a15ac53a9b2c7d0d080f677e9cb655b119f23658b0d68846')

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
