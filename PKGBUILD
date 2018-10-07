# $Id$
# Maintainer: Sebastian Weiland <sebastianweiland97@gmail.com>
# Contributor: Martchus <martchus@gmx.net>
# Original package: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_appname_=vlc
pkgname=${_appname_}-nightly
pkgver=4.0.0v20181007
_pkgver=4.0.0
_snapshot_=20181007
_snapver_=0231
_suffix_=dev
_nightly_=${_snapshot_}-${_snapver_}
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player - nightly snapshot'
url='https://nightlies.videolan.org/'
arch=('x86_64')
license=('LGPL2.1' 'GPL2')
depends=('aribb25' 'libmfx' 'a52dec' 'libidn' 'libdvbpsi' 'libxpm' 'libdca' 'libproxy' 'glibc' 'libtiger' 'lua'
         'libmatroska' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp' 'libmad'
         'libmpeg2' 'xcb-util-keysyms' 'mesa' 'libtar' 'libxinerama' 'libxkbcommon' 'libsecret'
         'libarchive' 'qt5-base' 'qt5-x11extras' 'qt5-svg' 'freetype2'
         'fribidi' 'harfbuzz' 'fontconfig' 'libxml2' 'gnutls' 'libplacebo'
         'wayland-protocols')
makedepends=('aribb24' 'gst-plugins-base-libs' 'live-media' 'libnotify' 'glibc' 'libbluray'
             'flac' 'libdc1394' 'libavc1394' 'libcaca' 'gtk3'
             'librsvg' 'libgme' 'xosd' 'twolame' 'aalib' 'avahi' 'libsystemd'
             'libmtp' 'libmicrodns' 'libdvdcss' 'smbclient'
             'vcdimager' 'libssh2' 'mesa' 'protobuf' 'libnfs' 'mpg123'
             'libdvdread' 'libdvdnav' 'libogg' 'libshout' 'libmodplug' 'libvpx'
             'libvorbis' 'speex' 'opus' 'libtheora' 'libpng'
             'libjpeg-turbo' 'libx265.so' 'libx264.so' 'zvbi' 'libass'
             'libkate' 'libtiger' 'sdl_image' 'libpulse' 'alsa-lib' 'jack'
             'libsamplerate' 'libsoxr' 'lirc' 'libgoom2' 'projectm'
             'chromaprint'

             'libfdk-aac' 'portaudio' 'sidplay2-libs' 'sndio')
optdepends=('avahi: service discovery using bonjour protocol'
            'gst-plugins-base-libs: for libgst plugins'
            'libdvdcss: decoding encrypted DVDs'
            'libavc1394: devices using the 1394ta AV/C'
            'libdc1394: IEEE 1394 access plugin'
            'kwallet: kwallet keystore'
            'libva-vdpau-driver: vdpau backend nvidia'
            'libva-intel-driver: video backend intel'
            'libbluray: Blu-Ray video input'
            'flac: Free Lossless Audio Codec plugin'
            'twolame: TwoLAME mpeg2 encoder plugin'
            'libgme: Game Music Emu plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'libmtp: MTP devices discovery'
            'libsystemd: udev services discovery'
            'smbclient: SMB access plugin'
            'libcdio: audio CD playback'
            'ttf-freefont: subtitle font '
            'ttf-dejavu: subtitle font'
            'libssh2: sftp access'
            'libnfs: NFS access'
            'mpg123: mpg123 codec'
            'protobuf: chromecast streaming'
            'libmicrodns: mDNS services discovery (chromecast etc)'
            'lua-socket: http interface'
            'live-media: RTSP input'
            'libdvdread: DVD input module'
            'libdvdnav: DVD with navigation input module'
            'libogg: Ogg and OggSpots codec'
            'libshout: shoutcast/icecast output plugin'
            'libmodplug: MOD output plugin'
            'libvpx: VP8 and VP9 codec'
            'libvorbis: Vorbis decoder/encoder'
            'speex: Speex codec'
            'opus: opus codec'
            'libtheora: theora codec'
            'libpng: PNG support'
            'libjpeg-turbo: JPEG support'
            'librsvg: SVG plugin'
            'libx264: H264 encoding'
            'x265: HEVC/H.265 encoder'
            'zvbi: VBI/Teletext decoding'
            'aribb24: ARIB subtitles'
            'libass: Subtitle support'
            'libkate: Kate codec'
            'libtiger: Tiger rendering for Kate streams'
            'sdl_image: SDL image support'
            'aalib: ASCII art video output'
            'libcaca: colored ASCII art video output'
            'libpulse: PulseAudio audio output'
            'alsa-lib: ALSA audio output'
            'jack: jack audio server'
            'libsamplerate: audio Resampler'
            'libsoxr: SoX audio Resampler'
            'chromaprint: Chromaprint audio fingerprinter'
            'lirc: lirc control'
            'libgoom2: Goom visualization'
            'projectm: ProjectM visualisation'
            'ncurses: ncurses interface'
            'libnotify: notification plugin'
            'gtk3: notification plugin'
            'libfdk-aac: FDK AAC codec'
            'portaudio: portaudio support'
            'vcdimager: navigate VCD with libvcdinfo'
            'schroedinger: schroedinger codec support'
            'sidplay2-libs: for C64 sid demuxer'
            'sndio: for OpenBSD sndio audio output')
conflicts=("${_appname_}-plugin" "${_appname_}")
provides=("${_appname_}")
replaces=("${_appname_}-plugin")
options=('!emptydirs')
source=("http://nightlies.videolan.org/build/source/vlc-${_pkgver}-${_nightly_}-${_suffix_}.tar.xz"
        'update-vlc-plugin-cache.hook'
        '0001-lua-fix-build-using-lua-5.3.patch'
        'find-deps.py')

pkgver() {
 printf ${_pkgver}v$_snapshot_
} 

prepare() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  ./bootstrap

  patch -Np1 -i "${srcdir}/0001-lua-fix-build-using-lua-5.3.patch"
  sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
  sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype/freetype.c
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure
}

build() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  export CFLAGS+=" -I/usr/include/samba-4.0" 
  export CPPFLAGS+=" -I/usr/include/samba-4.0" 
  export CXXFLAGS+=" -std=c++11"
  export LUAC=/usr/bin/luac
  export LUA_LIBS="`pkg-config --libs lua`"
  export LDFLAGS+=" `pkg-config --libs xkbcommon` "
  export RCC=/usr/bin/rcc-qt5

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --enable-nls \
              --enable-archive \
              --enable-live555 \
              --enable-dc1394 \
              --enable-dv1394 \
              --enable-dvdread \
              --enable-dvdnav \
              --enable-bluray \
              --disable-opencv \
              --enable-smbclient \
              --enable-sftp \
              --enable-nfs \
              --enable-realrtsp \
              --enable-dvbpsi \
              --enable-gme \
              --enable-ogg \
              --enable-shout \
              --enable-matroska \
              --enable-mod \
              --enable-mpc \
              --enable-mad \
              --enable-mpg123 \
              --enable-gst-decode \
              --enable-avcodec \
              --enable-libva \
              --enable-avformat \
              --enable-postproc \
              --enable-faad \
              --enable-vpx \
              --enable-twolame \
              --enable-a52 \
              --enable-dca \
              --enable-flac \
              --enable-libmpeg2 \
              --enable-vorbis \
              --enable-speex \
              --enable-opus \
              --enable-oggspots \
              --disable-schroedinger \
              --enable-png \
              --enable-jpeg \
              --enable-x264 \
              --enable-x265 \
              --enable-zvbi \
              --enable-libass \
              --enable-kate \
              --enable-tiger \
              --enable-vdpau \
              --enable-wayland \
              --enable-sdl-image \
              --enable-freetype \
              --enable-fribidi \
              --enable-harfbuzz \
              --enable-fontconfig \
              --enable-svg \
              --enable-svgdec \
              --enable-aa \
              --enable-caca \
              --enable-pulse \
              --enable-alsa \
              --enable-jack \
              --enable-samplerate \
              --enable-soxr \
              --enable-chromaprint \
              --enable-chromecast \
              --enable-qt \
              --enable-skins2 \
              --enable-libtar \
              --enable-ncurses \
              --enable-lirc \
              --enable-goom \
              --enable-projectm \
              --enable-avahi \
              --enable-mtp \
              --enable-upnp \
              --enable-microdns \
              --enable-libxml2 \
              --disable-libgcrypt \
              --enable-gnutls \
              --enable-taglib \
              --enable-secret \
              --enable-kwallet \
              --disable-update-check \
              --enable-notify \
              --enable-libplacebo \
              --enable-vlc \
              \
              --libexecdir=/usr/lib \
              --disable-daala \
              --enable-fdkaac \
              --with-kde-solid=/usr/share/solid/actions/ \
              --enable-aribsub
  make V=1
}

package() {
  cd "${_appname_}-${_pkgver}-${_suffix_}"

  make -i DESTDIR="${pkgdir}" install

  for res in 16 32 48 128; do
    install -D -m644 "${srcdir}/${_appname_}-${_pkgver}-${_suffix_}/share/icons/${res}x${res}/${_appname_}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_appname_}.png"
  done

  install -Dm644 "$srcdir"/update-vlc-plugin-cache.hook "$pkgdir"/usr/share/libalpm/hooks/update-vlc-plugin-cache.hook

  # Update dependencies automatically based on dynamic libraries
  # _detected_depends=($(find "$pkgdir"/usr -name "*.so" | xargs python "$srcdir"/find-deps.py))

  #  msg 'Auto-detected dependencies:'
  #  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  #  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}

sha256sums=('875078ec8a3912a51225701cb29ca7fb75d66a48adf2546ad63930c58569ec5e'
            'c6f60c50375ae688755557dbfc5bd4a90a8998f8cf4d356c10d872a1a0b44f3a'
            '75ad8802bad1a79754e40fd107f5a6922c54f7467dadef8b439b49d410c8f7d2'
            '90b0e34d5772d2307ba07a1c2aa715db7488389003cfe6d3570b2a9c63061db7')
