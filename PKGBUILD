# Maintainer:
# Contributor: Oliver Braunschweig <olt78 at web dot de>
# Contributor: Andrew Crerar <crerar@archlinux.org>

_pkgname="vlc"
pkgname="vlc-git"
pkgver=4.0.0.r34182.g39a4b41
pkgrel=2
pkgdesc="Multi-platform MPEG, VCD/DVD, and DivX player (monolithic)"
url="https://github.com/videolan/vlc"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('i686' 'x86_64')

depends=(
  'aribb24'
  'chromaprint'
  'faad2'
  'ffmpeg'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gnutls'
  'harfbuzz'
  'libarchive'
  'libdvbpsi'
  'libebur128'
  'libidn'
  'libmad'
  'libmatroska'
  'libmpcdec'
  'libplacebo'
  'libsecret'
  'libupnp'
  'libxinerama'
  'libxml2'
  'libxpm'
  'lua'
  'qt6-base'
  'qt6-declarative'
  'rnnoise'
  'taglib'
  'xcb-util-keysyms'
)
makedepends=(
  'ffnvcodec-headers'
  'git'
  'meson'
  'qt6-shadertools'
  'qt6-tools'
  'vulkan-headers'
  'wayland-protocols'
)
optdepends=(
  'kwallet: kwallet keystore' # via D-Bus
  'libva-intel-driver: video backend intel'
  'libva-vdpau-driver: vdpau backend nvidia'
  'lua-socket: http interface'
)

_optdeps=(
  'aom: AOM AV1 codec'
  'aribb25: aribcam support'
  'avahi: service discovery using bonjour protocol'
  'dav1d: dav1d AV1 decoder'
  'flac: Free Lossless Audio Codec plugin'
  'fluidsynth: FluidSynth based MIDI playback plugin'
  'gst-plugins-base-libs: for libgst plugins'
  'gtk3: notification plugin'
  'jack: jack audio server'
  'kwindowsystem: kwin background blur effect'
  'libass: Subtitle support'
  'libavc1394: devices using the 1394ta AV/C'
  'libbluray: Blu-Ray video input'
  'libcaca: colored ASCII art video output'
  'libdc1394: IEEE 1394 access plugin'
  'libdvdnav: DVD with navigation input module'
  'libdvdread: DVD input module'
  'libgme: Game Music Emu plugin'
  'libgoom2: Goom visualization'
  'libjpeg-turbo: JPEG support'
  'libkate: Kate codec'
  'libmicrodns: mDNS services discovery (chromecast etc)'
  'libmodplug: MOD output plugin'
  'libmtp: MTP devices discovery'
  'libnfs: NFS access'
  'libnotify: notification plugin'
  'libogg: Ogg and OggSpots codec'
  'libpng: PNG support'
  'libpulse: PulseAudio audio output'
  'librsvg: SVG plugin'
  'libsamplerate: audio Resampler'
  'libshout: shoutcast/icecast output plugin'
  'libsoxr: SoX audio Resampler'
  'libssh2: sftp access'
  'libtheora: theora codec'
  'libtiger: Tiger rendering for Kate streams'
  'libvorbis: Vorbis decoder/encoder'
  'libvpx: VP8 and VP9 codec'
  'libxkbcommon: X11 XCB support'
  'lirc: lirc control'
  'live-media: streaming over RTSP'
  'mpg123: mpg123 codec'
  'opus: opus codec'
  'pcsclite: aribcam support'
  'projectm: ProjectM visualisation'
  'protobuf: chromecast streaming'
  'smbclient: SMB access plugin'
  'speex: Speex codec'
  'srt: SRT input/output plugin'
  'systemd-libs: udev services discovery'
  'twolame: TwoLAME mpeg2 encoder plugin'
  'zvbi: VBI/Teletext/webcam/v4l2 capture/decoding'
)

for i in "${_optdeps[@]}"; do
  makedepends+=("${i%%:*}")
  optdepends+=("$i")
done

provides=(
  "vlc=${pkgver%.g*}"
  "libvlc=${pkgver%.g*}"
  vlc-cli
  vlc-gui-{ncurses,qt,skins2}
  vlc-plugin-{a52dec,aalib,alsa,aom,archive,aribb24,aribb25,ass,avahi,bluray,caca,cddb,chromecast,dav1d,dbus,dbus-screensaver,dca,dvb,dvd,faad2,ffmpeg,firewire,flac,fluidsynth,freetype,gme,gnutls,gstreamer,inflate,jack,journal,jpeg,kate,kwallet,libsecret,lirc,live555,lua,mad,matroska,mdns,modplug,mpeg2,mpg123,mtp,musepack,nfs,notify,ogg,opus,png,pulse,quicksync,samplerate,sdl,sftp,shout,smb,soxr,speex,srt,svg,tag,theora,twolame,udev,upnp,vorbis,vpx,x264,x265,xml,zvbi}
  vlc-plugins-{all,base,extra,video-output,visualization}
)
conflicts=(
  vlc
  libvlc
  vlc-cli
  vlc-gui-{ncurses,qt,skins2}
  vlc-plugin-{a52dec,aalib,alsa,aom,archive,aribb24,aribb25,ass,avahi,bluray,caca,cddb,chromecast,dav1d,dbus,dbus-screensaver,dca,dvb,dvd,faad2,ffmpeg,firewire,flac,fluidsynth,freetype,gme,gnutls,gstreamer,inflate,jack,journal,jpeg,kate,kwallet,libsecret,lirc,live555,lua,mad,matroska,mdns,modplug,mpeg2,mpg123,mtp,musepack,nfs,notify,ogg,opus,png,pulse,quicksync,samplerate,sdl,sftp,shout,smb,soxr,speex,srt,svg,tag,theora,twolame,udev,upnp,vorbis,vpx,x264,x265,xml,zvbi}
  vlc-plugins-{all,base,extra,video-output,visualization}
)

options=('!emptydirs' '!lto')

_pkgsrc="$_pkgname.github"
source=(
  "$_pkgsrc"::"git+$url.git"
  'update-vlc-plugin-cache.hook'
)
sha256sums=(
  'SKIP'
  'b98043683dd90d3f5a3f501212dfc629839b661100de5ac79fd30cb7b4a06f13'
)

pkgver() {
  cd "$_pkgsrc"
  printf "%s.r%s.g%s" "$(grep 'AC_INIT' configure.ac | sed 's/[^0-9\.]*//g')" "$(git describe --tags --long | cut -d '-' -f 3)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgsrc"
  ./bootstrap
  autoreconf -vf

  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed -e 's|-Werror-implicit-function-declaration||g' \
    -e 's|whoami|echo builduser|g' \
    -e 's|hostname -f|echo arch|g' \
    -i configure
}

build() {
  export CFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CPPFLAGS+=" -I/usr/include/samba-4.0"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/} -std=c++17"

  export RCC=/usr/lib/qt6/rcc
  export QMAKE=/usr/bin/qmake6
  export QTPATHS6="/usr/lib/qt6/bin/qtpaths6"

  local _meson_args=(
    -Dbranch_protection=disabled
    -Davx=disabled
    -Dsse=disabled
    -Dtests=disabled
    -Dupdate-check=disabled

    -Daribcaption=disabled
    -Ddecklink=disabled
    -Ddsm=disabled # smb/cifs
    -Ddvbcsa=disabled
    -Dfdk-aac=disabled
    -Dfreerdp=disabled
    -Dlibcddb=disabled
    -Dlibgcrypt=disabled
    -Dlive555=disabled
    -Dmacosx_avfoundation=disabled # macos
    -Dmedialibrary=disabled
    -Dminimal_macosx=disabled # macos
    -Drist=disabled
    -Dschroedinger=disabled
    -Dshine=disabled
    -Dsid=disabled
    -Dsndio=disabled
    -Dspatialaudio=disabled
    -Dvnc=disabled
    -Dvsxu=disabled
    -Dwasapi=disabled # windows
    -Dx262=disabled
  )

  arch-meson ${_meson_args[@]} "$_pkgsrc" build
  meson compile -C build
}

package() {
  provides+=(
    'libvlc.so'
    'libvlccore.so'
  )

  meson install -C build --destdir "$pkgdir"

  install -Dm 644 "$_pkgsrc/share/icons/256x256/vlc.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "$srcdir/update-vlc-plugin-cache.hook" -t "$pkgdir/usr/share/libalpm/hooks/"
}
