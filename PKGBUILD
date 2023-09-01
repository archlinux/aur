# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="Command-line DNS client for humans "
arch=('x86_64' 'aarch64')
url="https://github.com/mr-karan/doggo"
license=('MIT')
depends=()
makedepends=()
provides=('doggo')
conflicts=('doggo')
source_x86_64=("https://github.com/mr-karan/doggo/releases/download/v${pkgver}/doggo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/mr-karan/doggo/releases/download/v${pkgver}/doggo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6f25bf2db476515e03b8293daae46d08e12ab060a8b170247fc294bc6bfb1554')
sha256sums_aarch64=('f9c8fc91d002a87db92ea9bee9d37a685bae830b830884746456643a9e7188f4')

package() {
    cd "${srcdir}"

    # Install doggo
    install -D -m0755 doggo \
        "${pkgdir}/usr/bin/doggo"

    # Install doggo-api
    install -D -m0755 doggo-api.bin \
        "${pkgdir}/usr/bin/doggo-api"

    # Copy license.
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    # Copy README.md
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp README.md \
        "${pkgdir}/usr/share/doc/${pkgname}"

    # Install completions.
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions/_doggo"
    cp completions/doggo.zsh \
        "${pkgdir}/usr/share/zsh/site-functions/_doggo"

    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/doggo.fish"
    cp completions/doggo.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/doggo.fish"
}
