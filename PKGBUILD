# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=obs-studio-tytan652
pkgver=29.1.3
pkgrel=3
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integrations. Plus V4L2 devices by paths, my bind interface PR, and sometimes backported fixes"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL3")
# To manage dependency rebuild easily, this will prevent you to rebuild OBS on non-updated system
_mbedtlsver=3.4
_pythonver=3.11
depends=(
  "alsa-lib" # Deps of ALSA plugin and CEF
  "curl" # Deps of OBS Studio and rtmp-services plugin
  "ffmpeg-obs>=6" # Deps of OBS Studio and FFmpeg plugin
  "fontconfig" # Deps of Freetype2 plugin
  "freetype2" # Deps of Freetype2 plugin
  "ftl-sdk" # Deps of Outputs plugin
  "gcc-libs" # Deps of any C related binary
  "glib2" # Deps of libobs, PipeWire plugin and CEF
  "glibc" # Deps of any C++ related binary
  "jansson" # Deps of libobs and rtmp-services plugin
  "libglvnd" # Deps of libobs-opengl and OBS Studio
  "libpipewire" # Deps of the PipeWire plugin
  "libpulse" # Deps of PulseAudio monitoring (in libobs) and PulseAudio plugin
  "librist" # Deps of FFmpeg plugin
  "libva" # Deps of FFmpeg plugin
  "libx11" # Deps of libobs, libobs-opengl, X11 Capture plugin, frontend tools plugin, obs-browser and CEF
  "libxcb" # Deps of libobs-opengl, X11 Capture plugin and CEF
  "libxcomposite" # Deps of the X11 capture plugin
  "libxkbcommon" # Deps of libobs, OBS Studio and CEF
  "mbedtls>=$_mbedtlsver" # Deps of OBS Studio and Outputs plugin
  "pciutils" # Deps of FFmpeg plugin
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
  "libfdk-aac" # Deps of FDK AAC plugin
  "luajit" # Deps of Scripting plugin
  "nlohmann-json" # Deps of Websocket plugin (headers-only lib)
  "python>=$_pythonver" # Deps of Scripting plugin
  "sndio" # Deps of sndio plugin
  "swig" # Deps of Scripting plugin
  "systemd-libs" # Deps of V4L2 plugin
  "v4l-utils" # Deps of V4L2 plugin
  "websocketpp" # Deps of Websocket plugin (headers-only lib)

  # Deps of obs-browser
  "cef-minimal-obs=103.0.0_5060_shared_textures_143.2591+g4204d54+chromium_103.0.5060.134_1"
)
optdepends=(
  "jack: JACK support"
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l-utils: V4L2 support"
  "systemd-libs: V4L2 support"
  "v4l2loopback-dkms: V4L2 virtual camera output"
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
  "qr::git+https://github.com/nayuki/QR-Code-generator.git"
  "bind_iface.patch" # Based on https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
  "0001-Add_finder_for_uthash.patch"
  "0002-Use_system_uthash.patch"
  "0003-Fix_blank_browser_dock_titles.patch"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "65116d10f03d390505fdb0bbf6fe649e8649500441dde91e029f2eb79bfdc80f"
  "ee54b9c6f7e17fcc62c6afc094e65f18b2e97963c2fe92289b2b91972ac206e5"
  "f4a56021a7f1c564f95b588d7c09b60a89efa2c1954c8a418cf6320b5a818542"
  "966250c40ab47276e1d420941b5b1e448886b0ab8643f25ba37dce08df68f34d"
  "8980d1e871177c3f65d5cf0c249ef36c5a9e2a6956bbc592283782ec58d825e7"
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
  # https://github.com/obsproject/obs-studio/pull/9373
  patch -Np1 -i "$srcdir/0003-Fix_blank_browser_dock_titles.patch"

  cd plugins/obs-websocket
  git config submodule.deps/qr.url $srcdir/qr
  git -c protocol.file.allow=always submodule update deps/qr

  cd "$srcdir/obs-studio"
  ## Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"

  ## (not up to date for 29) linux-v4l2: Save device by id or path (https://github.com/obsproject/obs-studio/pull/6493)
  ## patch -Np1 < "$srcdir/v4l2_by-path.patch"
}

build() {
  export CXXFLAGS="$CXXFLAGS -Wno-error=dangling-reference"

  cmake -B build -S obs-studio \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_RTMPS=ON \
    -DQT_VERSION=6 \
    -DENABLE_LIBFDK=ON \
    -DENABLE_JACK=ON \
    -DENABLE_SNDIO=ON \
    -DENABLE_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$pkgver" \
    -Wno-dev

    sed -i "s|#define OBS_VERSION |#define OBS_VERSION \"$pkgver-tytan652-$pkgrel\" //|" build/config/obsconfig.h

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
