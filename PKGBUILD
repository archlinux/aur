# Maintainer: czyt <czytcn@gmail.com>

pkgname=reason-network-bin
pkgver=0.12.17
pkgrel=1
pkgdesc="Team directory and message bus that lets coding agents on different machines message each other"
arch=('x86_64' 'aarch64')
url="https://reasonmachines.com"
license=('Apache-2.0' 'MIT')
# Upstream ships statically linked musl builds, so nothing is linked at
# runtime. The rest are helpers it shells out to when present.
optdepends=(
    'ca-certificates: TLS connections to the Reason service'
    'libnotify: desktop notification for messages waiting approval'
    'systemd: background service and busctl integration'
    'xdg-utils: opening the browser for sign-in'
)
provides=('reason-network')
conflicts=('reason-network')
options=('!strip' '!debug')

_repo="https://github.com/reason-machines/reason-network"
_tarball="reason-network"
source_x86_64=(
    "${_tarball}-${pkgver}-x86_64.tar.gz::${_repo}/releases/download/v${pkgver}/${_tarball}-x86_64-unknown-linux-musl.tar.gz"
    "LICENSE-APACHE::${_repo}/raw/v${pkgver}/LICENSE-APACHE"
    "LICENSE-MIT::${_repo}/raw/v${pkgver}/LICENSE-MIT"
    "NOTICE::${_repo}/raw/v${pkgver}/NOTICE"
)
source_aarch64=(
    "${_tarball}-${pkgver}-aarch64.tar.gz::${_repo}/releases/download/v${pkgver}/${_tarball}-aarch64-unknown-linux-musl.tar.gz"
    "LICENSE-APACHE::${_repo}/raw/v${pkgver}/LICENSE-APACHE"
    "LICENSE-MIT::${_repo}/raw/v${pkgver}/LICENSE-MIT"
    "NOTICE::${_repo}/raw/v${pkgver}/NOTICE"
)
sha256sums_x86_64=('2234527ff9330c78bff8581cc060bf1396e15d8091c27fb5acdb989010f5018f'
                   'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
                   '0c0f2e36352216ffb048903b26375f2d2a2c2cca5efed60d821090e884b48198'
                   '5da1765ea1af12a1649cb26e28c2620a706b15a99fbd148eccf3709e98ecb418')
sha256sums_aarch64=('e53ef46ee57eb9e9cd3b13d45acfe5ce4766c18861b46926560e34903adaa151'
                    'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
                    '0c0f2e36352216ffb048903b26375f2d2a2c2cca5efed60d821090e884b48198'
                    '5da1765ea1af12a1649cb26e28c2620a706b15a99fbd148eccf3709e98ecb418')

package() {
    # Both archives contain a single top-level "reason-network", and makepkg
    # only fetches the sources for $CARCH, so there is no clash here.
    install -Dm755 "${srcdir}/${_tarball}" "${pkgdir}/usr/bin/${_tarball}"

    install -Dm644 "${srcdir}/LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "${srcdir}/LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
