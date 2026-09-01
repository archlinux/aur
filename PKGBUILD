# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=2.0.0
pkgrel=1
pkgdesc='A retro terminal music player inspired by Winamp 2.x'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/cliamp'
license=('MIT')
depends=('alsa-lib' 'flac' 'libvorbis' 'libogg' 'mpg123' 'ffmpeg' 'yt-dlp')
optdepends=('pipewire-alsa: audio output on PipeWire systems'
  'pulseaudio-alsa: audio output on PulseAudio systems')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/cliamp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('32b9f5962f5318de818d741f79e3ef15317c98092bed6eccd68d940bb035112e')

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
    install -Dm644 cliamp.desktop "${pkgdir}/usr/share/applications/cliamp.desktop"
    install -Dm644 Cliamp.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cliamp.png"
    install -Dm644 Cliamp.png "${pkgdir}/usr/share/pixmaps/cliamp.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
