# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=1.21.3
pkgrel=1
pkgdesc='A retro terminal music player inspired by Winamp 2.x'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/cliamp'
license=('MIT')
depends=('alsa-lib' 'flac' 'libvorbis' 'libogg' 'ffmpeg' 'yt-dlp')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/cliamp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1729b6d907cc577702e8e3d3b093ebb79671c683b6e847a330f5de42da3b6271')

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
