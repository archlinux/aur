# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=1.12.3
pkgrel=1
pkgdesc='A retro terminal music player inspired by Winamp 2.x'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/cliamp'
license=('MIT')
depends=('alsa-lib' 'ffmpeg' 'yt-dlp')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/cliamp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6de051553b80a0f92972aa7ed771ff8d002080e2e5b76edeb543786b7b07a62b')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=1
    go build -trimpath -buildmode=pie \
        -ldflags="-s -w -X main.version=v${pkgver} -linkmode=external" \
        -o cliamp .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 cliamp "${pkgdir}/usr/bin/cliamp"
}
