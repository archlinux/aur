# Maintainer: Nicola Hinssen <nicola.hinssen@gmail.com>

pkgname=ffmpeg-emby
pkgver=20190409
pkgrel=1
_ffmpeg_ver=2019_04_09
_ffdetect_ver=4.0.3
pkgdesc='FFmpeg for Emby Server'
arch=('x86_64')
url='https://emby.media'
license=('custom')
depends=('alsa-lib'
         'aom'
         'fribidi'
         'gnutls'
         'lame'
         'libass.so'
         'libdrm'
         'libfreetype.so'
         'libmfx.so'
         'libtheora'
         'libva-drm.so'
         'libva.so'
         'libva-x11.so'
         'libvorbisenc.so'
         'libvorbis.so'
         'libx264.so'
         'opus'
         'zvbi')
makedepends=('ffnvcodec-headers8.1'
             'nasm')
provides=('ffdetect-emby'
          'ffprobe-emby')
source=("https://mediabrowser.github.io/embytools/ffmpeg-${_ffmpeg_ver}.tar.gz"
        "https://mediabrowser.github.io/embytools/ffdetect_${_ffdetect_ver}_x64.tar.xz"
        'license.docx')
noextract=(license.docx)
sha256sums=('d2081fd92e92ee90561c91edbd28ccba4beb1d72bdd38cd94c338726020e2e62'
            '85697071cb6412d244fc6dd76f3561b6a42d7556ef20f26a702542b58198f0c7'
            'a6d7ea65dcb06392479a85e1a10a7aeb872d803da6f784f6935fcd4ee63008c6')

build() {
  cd ffmpeg-${_ffmpeg_ver}

  export PKG_CONFIG_PATH=/usr/lib/ffnvcodec8.1/pkgconfig

  ./configure \
    --disable-doc \
    --disable-ffplay \
    --disable-shared \
    --disable-vdpau \
    --disable-libxcb \
    --disable-lzma \
    --disable-sdl2 \
    --disable-xlib \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-libaom \
    --enable-libass \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libmfx \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libzvbi \
    --enable-version3 \
    --enable-nvdec \
    --enable-nvenc \
    --enable-static \
    --enable-vaapi
  make
}

package() {
  install -Dm 755 bin/ffdetect "${pkgdir}"/usr/bin/ffdetect-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-emby
  install -Dm 755 ffmpeg-${_ffmpeg_ver}/ffprobe "${pkgdir}"/usr/bin/ffprobe-emby
  install -Dm 644 license.docx "$pkgdir/usr/share/licenses/$pkgname/license.docx"
}
