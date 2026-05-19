# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR package: rosec-provider-keepassxc-file-bin
#
# This PKGBUILD installs the pre-built KeePassXC (.kdbx file) WASM provider
# for rosec from the GitHub release.  The provider reads a KeePassXC kdbx
# database directly from disk; KeePassXC remains the editor.
#
# This provider is currently marked EXPERIMENTAL upstream — interfaces and
# on-disk caching behaviour may change between releases.
#
# The release workflow renders this file by substituting 0.0.28 and
# d0fb4d3bb55c8f3519c34206a7600c028a64137ec4082b423a333b54808a6540 before committing to the AUR.
#
# To build manually, replace the placeholders and run makepkg -si.

pkgname=rosec-provider-keepassxc-file-bin
pkgver=0.0.28
pkgrel=1
pkgdesc="KeePassXC (file) read-only provider for rosec (prebuilt, experimental)"
arch=('any')
url="https://github.com/jmylchreest/rosec"
license=('MIT')
depends=(
    'rosec'
)
provides=('rosec-provider-keepassxc-file')
conflicts=('rosec-provider-keepassxc-file')

source=(
    "rosec-provider-keepassxc-file-${pkgver}.wasm.tar.gz::https://github.com/jmylchreest/rosec/releases/download/v${pkgver}/rosec-provider-keepassxc-file-${pkgver}.wasm.tar.gz"
)
sha256sums=('d0fb4d3bb55c8f3519c34206a7600c028a64137ec4082b423a333b54808a6540')

package() {
    install -Dm644 "${srcdir}/rosec_keepassxc_file.wasm" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_keepassxc_file.wasm"
    install -Dm644 "${srcdir}/rosec_keepassxc_file.wasm.policy.toml" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_keepassxc_file.wasm.policy.toml"
    install -Dm644 "${srcdir}/rosec_keepassxc_file.wasm.minisig" \
        "${pkgdir}/usr/lib/rosec/providers/rosec_keepassxc_file.wasm.minisig"
}
