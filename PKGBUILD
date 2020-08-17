# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=selene-media-converter
pkgver=17.7
pkgrel=2
pkgdesc="Simple but powerful audio/video converter for many formats"
arch=(i686 x86_64)
url="https://github.com/teejee2008/selene"
license=(GPL3)
depends=(gtk3 json-glib libgee libsoup mediainfo ffmpeg)
optdepends=('gpac: MP4Box muxer'
            'fdk-aac-enc: Fraunhofer FDK AAC encoder'
            'libav-no-libs: Libav encoder'
            'libkate: Kate subtitle encoder'
            'lame: LAME Mp3 encoder'
            'mkvtoolnix-cli: Matroska muxer'
            'mplayer: Media player'
            'mpv: Media player'
            'neroaacenc-bin: Nero AAC Audio encoder'
            'libogg: OGG audio encoder'
            'liboggz: OGG merge tool'
            'opus-tools: Opus audio encoder'
            'smplayer: media player'
            'sox: SoX audio processing utility'
            'vlc: media player'
            'libvpx: VP8 video encoder'
            'x264: H.264 video encoder'
            'x265: H.265 video encoder')
makedepends=(vala0.44 chrpath)
conflicts=(selene-media-encoder selene-media-encoder-bzr)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4068d7269a219afa973592860171b0d9d07fc7165a3234dab968320c2507b32c')

build() {
  cd "$srcdir/selene-${pkgver}"
  make
}

package() {
  cd "$srcdir/selene-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chrpath --delete ${pkgdir}/usr/bin/selene
  rm ${pkgdir}/usr/bin/selene-uninstall
}
