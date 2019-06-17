# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_srcname=vlc
pkgname=vlc-decklink
pkgver=3.0.7.1
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player (with decklink support)'
url='https://www.videolan.org/vlc/'
arch=('x86_64')
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'libproxy' 'lua' 'libidn'
         'libmatroska' 'taglib' 'libmpcdec' 'ffmpeg' 'faad2' 'libupnp' 'libmad'
         'libmpeg2' 'xcb-util-keysyms' 'libtar' 'libxinerama' 'libsecret'
         'libarchive' 'qt5-base' 'qt5-x11extras' 'qt5-svg' 'freetype2'
         'fribidi' 'harfbuzz' 'fontconfig' 'libxml2' 'gnutls' #'libplacebo'
         'wayland-protocols' 'aribb24')
makedepends=('gst-plugins-base-libs' 'live-media' 'libnotify' 'libbluray'
             'flac' 'libdc1394' 'libavc1394' 'libcaca' 'gtk3'
             'librsvg' 'libgme' 'xosd' 'twolame' 'aalib' 'avahi' 'systemd-libs'
             'libmtp' 'libupnp' 'libmicrodns' 'libdvdcss' 'smbclient'
             'vcdimager' 'libssh2' 'mesa' 'protobuf' 'libnfs' 'mpg123'
             'libdvdread' 'libdvdnav' 'libogg' 'libshout' 'libmodplug' 'libvpx'
             'libvorbis' 'speex' 'opus' 'libtheora' 'libpng' 'libjpeg-turbo'
             'libx265.so' 'libx264.so' 'zvbi' 'libass' 'libkate' 'libtiger'
             'sdl_image' 'libpulse' 'alsa-lib' 'jack' 'libsamplerate' 'libsoxr'
             'lirc' 'libgoom2' 'projectm' 'chromaprint' 'aom' 'srt' 'dav1d'
             'blackmagic-decklink-sdk')
optdepends=('avahi: service discovery using bonjour protocol'
            'aom: AOM AV1 codec'
            'gst-plugins-base-libs: for libgst plugins'
            'dav1d: dav1d AV1 decoder'
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
            'systemd-libs: udev services discovery'
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
            'x264: H264 encoding'
            'x265: HEVC/H.265 encoder'
            'zvbi: VBI/Teletext decoding'
            'libass: Subtitle support'
            'libkate: Kate codec'
            'libtiger: Tiger rendering for Kate streams'
            'sdl_image: SDL image support'
            'srt: SRT input/output plugin'
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
            'gtk3: notification plugin')
provides=('vlc')
conflicts=('vlc' 'vlc-plugin')
replaces=('vlc-plugin')
options=('!emptydirs')
source=("https://download.videolan.org/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.xz"{,.asc}
        'update-vlc-plugin-cache.hook'
        'lua53_compat.patch')
sha256sums=('0655804371096772f06104b75c21cde8a76e3b6c8a2fdadc97914f082c6264f5'
            'SKIP'
            'c6f60c50375ae688755557dbfc5bd4a90a8998f8cf4d356c10d872a1a0b44f3a'
            'd1cb88a1037120ea83ef75b2a13039a16825516b776d71597d0e2eae5df2d8fa')
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
    cd "${_srcname}-${pkgver}"
    
    sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
    sed -e 's|-Werror-implicit-function-declaration||g' -i configure
    
    sed 's|whoami|echo builduser|g' -i configure
    sed 's|hostname -f|echo arch|g' -i configure
    
    local _src
    for _src in "${source[@]}"
    do
        _src="${_src%%::*}"
        _src="${_src##*/}"
        [[ "$_src" = *.patch ]] || continue
        printf '%s\n' "  -> Applying patch '${_src}'..."
        patch -Np1 -i "../${_src}"
    done
}

build() {
    cd "${_srcname}-${pkgver}"
    
    export CFLAGS+=' -I/usr/include/samba-4.0'
    export CPPFLAGS+=' -I/usr/include/samba-4.0'
    export CXXFLAGS+=' -std=c++11'
    export LUAC='/usr/bin/luac'
    export LUA_LIBS="$(pkg-config --libs lua)"
    export RCC='/usr/bin/rcc-qt5'

    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --with-kde-solid='/usr/share/solid/actions/' \
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
        --disable-fdkaac \
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
        --disable-libplacebo \
        --enable-vlc \
        --enable-aribsub \
        --enable-aom \
        --enable-srt \
        --enable-dav1d \
        --enable-decklink
        
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    local _res
    
    make DESTDIR="$pkgdir" install
    
    for _res in 16 32 48 128 256
    do
        install -D -m644 "${srcdir}/vlc-${pkgver}/share/icons/${_res}x${_res}/vlc.png" \
                         "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/vlc.png"
    done
    
    install -D -m644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}
