# Maintainer: fredrir <fhansteen@gmail.com>
# Prebuilt-binary AUR package. The CI release workflow injects `pkgver` from the
# git tag and recomputes `sha256sums` (via updpkgsums) before pushing to the AUR.
pkgname=nsql-bin
_pkgname=nsql
pkgver=0.1.5
pkgrel=1
pkgdesc="Run SQL from your terminal, composed in your real Neovim — without taking over the screen (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/fredrir/nsql"
license=('0BSD')
provides=('nsql')
conflicts=('nsql')
depends=('dbus')
optdepends=('neovim: inline/embedded SQL editor (falls back to vim/vi/$EDITOR otherwise)')
options=('!strip')  # dist already strips the release binary
source_x86_64=("nsql-x86_64-unknown-linux-gnu-${pkgver}.tar.xz::https://github.com/fredrir/nsql/releases/download/v${pkgver}/nsql-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("nsql-aarch64-unknown-linux-gnu-${pkgver}.tar.xz::https://github.com/fredrir/nsql/releases/download/v${pkgver}/nsql-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('e531c28638f09e305eb3d444289092f44e691adf6e3a8a2ca9deade1d20b357b')
sha256sums_aarch64=('ba6dee12f1b705efb2bf97da912b4d037d0d6f9fffc0dc7c60e1bc15bbcaabb3')

package() {
    # dist tarballs wrap their contents in a top-level "<archive>/" directory.
    local _archive="nsql-${CARCH}-unknown-linux-gnu"
    install -Dm755 "${srcdir}/${_archive}/nsql" "${pkgdir}/usr/bin/nsql"
    install -Dm644 "${srcdir}/${_archive}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_archive}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
