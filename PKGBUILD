# Maintainer: Ricky Banks <your@email.com>
pkgname=nirimon-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal-based monitor configuration TUI for the Niri Wayland compositor"
arch=('x86_64')
url="https://github.com/rickycbanks/nirimon"
license=('MIT')
depends=('niri')
provides=('nirimon')
conflicts=('nirimon')
source=("nirimon-linux-amd64::https://github.com/rickycbanks/nirimon/releases/download/v${pkgver}/nirimon-linux-amd64"
        "nirimon-linux-amd64.sha256::https://github.com/rickycbanks/nirimon/releases/download/v${pkgver}/nirimon-linux-amd64.sha256")
sha256sums=('SKIP'
            'SKIP')

# To update for a new release:
#   1. Bump pkgver above
#   2. Run: updpkgsums
#   3. Run: makepkg --printsrcinfo > .SRCINFO
#   4. Commit and push

prepare() {
    # Verify the upstream checksum matches what we downloaded
    local expected
    expected=$(awk '{print $1}' "${srcdir}/nirimon-linux-amd64.sha256")
    echo "${expected}  ${srcdir}/nirimon-linux-amd64" | sha256sum --check
}

package() {
    install -Dm755 "${srcdir}/nirimon-linux-amd64" "${pkgdir}/usr/bin/nirimon"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
MIT License — see https://github.com/rickycbanks/nirimon/blob/main/LICENSE
EOF
}
