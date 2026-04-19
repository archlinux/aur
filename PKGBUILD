# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=dircmp-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Terminal TUI for comparing two directories side by side"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/dircmp"
license=('MIT')
depends=('glibc')
provides=('dircmp')
conflicts=('dircmp')
optdepends=('rclone: remote directory support')
options=('!strip')

source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/dircmp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dircmp-linux-arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('ce9d6e3f69560d5b7bcf7cc07c4720d25a4b63ccda4dfcf85b01dbcf9bdd75b8')
sha256sums_aarch64=('4066b3e2db92a3265cf18f9dcbd3e0dae489a749fcd1429676ed70618b2e7a52')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dircmp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Shell completions
    "${pkgdir}/usr/bin/dircmp" completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/dircmp"
    "${pkgdir}/usr/bin/dircmp" completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_dircmp"
    "${pkgdir}/usr/bin/dircmp" completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/dircmp.fish"
}
