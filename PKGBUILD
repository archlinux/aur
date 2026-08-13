# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=cliamp
pkgver=1.63.2
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
sha256sums=('968ff98c1e49bae8a0ce63acf5c77a9621ef70756a048e3df5e79454b82a9eef')

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
