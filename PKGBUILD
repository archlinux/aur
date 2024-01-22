# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=obs-studio-tytan652
pkgver=30.0.2
pkgrel=3
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integrations. Plus V4L2 devices by paths, my bind interface PR, and sometimes backported fixes"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=('GPL-2.0-or-later')
# To manage dependency rebuild easily, this will prevent you to rebuild OBS on non-updated system
_libdatachannelver=0.20
_mbedtlsver=3.4
_pythonver=3.11
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg-obs>=6" # Deps of OBS Studio and FFmpeg plugin
  "fontconfig" # Deps of Freetype2 plugin
  "freetype2" # Deps of Freetype2 plugin
  "ftl-sdk" # Deps of Outputs plugin
  "gcc-libs" # Deps of any C++ related binary
  "glib2" # Deps of libobs, PipeWire plugin and CEF
  "glibc" # Deps of any C related binary
  "jansson" # Deps of libobs and rtmp-services plugin
  "libgl" # Deps of libobs-opengl and OBS Studio
  "libpipewire" # Deps of the PipeWire plugin
  "libpulse" # Deps of PulseAudio monitoring (in libobs) and PulseAudio plugin
  "librist" # Deps of FFmpeg plugin
  "libva" # Deps of FFmpeg plugin and QSV plugin
  "libx11" # Deps of libobs, libobs-opengl, X11 Capture plugin, frontend tools plugin, obs-browser and CEF
  "libxcb" # Deps of libobs-opengl, X11 Capture plugin and CEF
  "libxcomposite" # Deps of the X11 capture plugin
  "libxkbcommon" # Deps of libobs, OBS Studio and CEF
  "mbedtls>=$_mbedtlsver" # Deps of OBS Studio and Outputs plugin
  "pciutils" # Deps of FFmpeg plugin
  "qrcodegencpp-cmake" # Deps of Websocket plugin
  "qt6-base" # Deps of OBS Studio and any frontend plugin
  "qt6-svg" # Deps of OBS Studio
  "qt6-wayland" # Needed to use Qt on Wayland platform
  "rnnoise" # Deps if the filter plugin
  "speexdsp" # Deps if the filter plugin
  "srt" # Deps of FFmpeg plugin
  "util-linux-libs" # Deps of libobs
  "vlc-luajit" # Deps of VLC Plugin ("vlc" issue crashes)
  "wayland" # Deps of libobs, libobs-opengl and CEF
  "x264" # Deps of the X264 plugin
  "zlib" # Deps of libobs

  # Deps of CEF
  "at-spi2-core" "dbus" "expat" "libcups" "libdrm" "libxdamage"
  "libxext" "libxfixes" "libxrandr" "mesa" "nspr" "nss"
)
## About vlc-luajit
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
## About ffmpeg-obs
# Read ffmpeg-obs PKGBUILD for more info
makedepends=(
  "asio" # Deps of Websocket plugin (headers-only lib)
  "cmake"
  "jack" # Deps of JACK plugin
  "git"
  "uthash" # Deps of libobs
  "libajantv2" # Deps of AJA plugin (static lib)
  "libdatachannel-nice>=$_libdatachannelver" # Deps of WebRTC plugin (NICE variant like the Flatpak)
  "libfdk-aac" # Deps of FDK AAC plugin
  "luajit" # Deps of Scripting plugin
  "nlohmann-json" # Deps of Websocket plugin (headers-only lib)
  "libvpl" # Deps of QSV plugin
  "python>=$_pythonver" # Deps of Scripting plugin
  "sndio" # Deps of sndio plugin
  "swig" # Deps of Scripting plugin
  "systemd-libs" # Deps of V4L2 plugin
  "v4l-utils" # Deps of V4L2 plugin
  "websocketpp" # Deps of Websocket plugin (headers-only lib)

  # Deps of obs-browser
  "cef-minimal-obs=103.0.0_5060_shared_textures_2594+g17f8588+chromium_103.0.5060.134_1"
)
optdepends=(
  "jack: JACK support"
  "libfdk-aac: FDK AAC codec support"
  "libvpl: QSV encoder support"
  "intel-media-sdk: QSV encoder support(<= Rocket Lake & >= Broadwell)"
  "onevpl-intel-gpu: QSV encoder support (>= Alder Lake)"
  "intel-media-driver: VAAPI encoder support (>= Broadwell)"
  "libva-intel-driver: VAAPI encoder support (<= Haswell)"
  "libva-mesa-driver: VAAPI encoder support"
  "swig: Scripting"
  "luajit: Lua scripting"
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l-utils: V4L2 support"
  "systemd-libs: V4L2 support"
  "v4l2loopback-dkms: V4L2 virtual camera output"
  "libdatachannel>=$_libdatachannelver: WHIP Support"
)
provides=("obs-studio=$pkgver" "obs-vst" "obs-websocket" "obs-browser")
conflicts=(
  "obs-studio" "obs-vst" "obs-websocket" "obs-browser"
  "obs-linuxbrowser" # This plugin is obsolete
  "libva-vdpau-driver" # This driver is abandonned and make OBS segfault if it happen to be loaded, try libva-nvidia-driver is you really need Nvidia decode through VAAPI
)
options=('debug')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "bind_iface_eyeballed.patch" # Based on https://github.com/tytan652/obs-studio/commits/bind_iface_eyeballed
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
  "0001-Add_finder_for_uthash.patch"
  "0002-Use_system_uthash.patch"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "23a0bd9f5e36d333b230ed8dfdfd06c3b4826187e3f858cde93200f5e0da2334"
  "ee54b9c6f7e17fcc62c6afc094e65f18b2e97963c2fe92289b2b91972ac206e5"
  "f4a56021a7f1c564f95b588d7c09b60a89efa2c1954c8a418cf6320b5a818542"
  "874456110d17d2efe02f8a1f47f58c877922d8bdab6435df334b9e6460b26bf8"
)

if [[ $CARCH == 'x86_64' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git config submodule.plugins/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i "$srcdir/0001-Add_finder_for_uthash.patch"
  patch -Np1 -i "$srcdir/0002-Use_system_uthash.patch"

  cd "$srcdir/obs-studio"
  ## Add network interface binding for RTMP on Linux (https://github.com/tytan652/obs-studio/commits/bind_iface_eyeballed)
  patch -Np1 < "$srcdir/bind_iface_eyeballed.patch"

  ## (not up to date for 29) linux-v4l2: Save device by id or path (https://github.com/obsproject/obs-studio/pull/6493)
  ## patch -Np1 < "$srcdir/v4l2_by-path.patch"
}

build() {
  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_RTMPS=ON \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$pkgver" \
    -DCALM_DEPRECATION=ON \
    -Wno-dev

    sed -i "s|#define OBS_VERSION |#define OBS_VERSION \"$pkgver-tytan652-$pkgrel\" //|" build/config/obsconfig.h

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
