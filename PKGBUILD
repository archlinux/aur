# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=1.13.3
pkgrel=1
pkgdesc='A retro terminal music player inspired by Winamp 2.x'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/cliamp'
license=('MIT')
depends=('alsa-lib' 'ffmpeg' 'yt-dlp')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/cliamp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4408ec3353338d6cbb40166f8ae155b356cc42ab3d77121aff07a72374357f49')

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
