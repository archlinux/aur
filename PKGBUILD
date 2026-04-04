# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=1.33.8
pkgrel=1
pkgdesc='A retro terminal music player inspired by Winamp 2.x'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/cliamp'
license=('MIT')
depends=('alsa-lib' 'flac' 'libvorbis' 'libogg' 'ffmpeg' 'yt-dlp')
optdepends=('pipewire-alsa: audio output on PipeWire systems'
  'pulseaudio-alsa: audio output on PulseAudio systems')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/cliamp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8d7d4ffb10287ceabc5e04591b2642ec931730fcd025be860c96307229700ae')

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
