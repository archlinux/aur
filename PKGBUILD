# Maintainer: fredrir <fhansteen@gmail.com>
# Prebuilt-binary AUR package. The CI release workflow injects `pkgver` from the
# git tag and recomputes `sha256sums` (via updpkgsums) before pushing to the AUR.
pkgname=nsql-bin
_pkgname=nsql
pkgver=0.1.3
pkgrel=1
pkgdesc="Run SQL from your terminal, composed in your real Neovim — without taking over the screen (prebuilt binary)"
arch=('x86_64')
url="https://github.com/fredrir/nsql"
license=('0BSD')
provides=('nsql')
conflicts=('nsql')
depends=('dbus')
optdepends=('neovim: inline/embedded SQL editor (falls back to vim/vi/$EDITOR otherwise)')
options=('!strip')  # dist already strips the release binary
_archive="nsql-x86_64-unknown-linux-gnu"
source=("${_archive}-${pkgver}.tar.xz::https://github.com/fredrir/nsql/releases/download/v${pkgver}/${_archive}.tar.xz")
sha256sums=('1b676db4b34765e9cd51b1191f72554f0e1556f2d4d1d231c0873b4476053d16')

package() {
    # dist tarballs wrap their contents in a top-level "<archive>/" directory.
    install -Dm755 "${srcdir}/${_archive}/nsql" "${pkgdir}/usr/bin/nsql"
    install -Dm644 "${srcdir}/${_archive}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_archive}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
