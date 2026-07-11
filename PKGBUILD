# Maintainer: fredrir <fhansteen@gmail.com>
# Prebuilt-binary AUR package. The CI release workflow injects `pkgver` from the
# git tag and recomputes `sha256sums` (via updpkgsums) before pushing to the AUR.
pkgname=nsql-bin
_pkgname=nsql
pkgver=0.1.8
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
sha256sums_x86_64=('598d9fde696a690f33969ee8b8a6fb4ca5c286ac61d2eaf288a536c2cbb84fbf')
sha256sums_aarch64=('bfdcd68170897cce4f73639596136cb17921d6683f49feab7f9cb4f9ab81387b')

package() {
    # dist tarballs wrap their contents in a top-level "<archive>/" directory.
    local _archive="nsql-${CARCH}-unknown-linux-gnu"
    install -Dm755 "${srcdir}/${_archive}/nsql" "${pkgdir}/usr/bin/nsql"
    install -Dm644 "${srcdir}/${_archive}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_archive}/THIRD-PARTY-LICENSES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.md"
    install -Dm644 "${srcdir}/${_archive}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
