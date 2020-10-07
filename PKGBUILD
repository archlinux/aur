# vim:set ts=2 sw=2 et:
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Maintainer graysky <graysky AT archlinux DOT us>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: marzoul
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

pkgbase=kodi-devel
pkgname=(
  "$pkgbase" "$pkgbase-x11" "$pkgbase-wayland" "$pkgbase-gbm"
  "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev"
)
pkgver=19.0a2
#_major=18.7.1
pkgrel=2
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez' 'python-simplejson'
  'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'git' 'meson' 'gtest'
  # wayland
  'wayland-protocols' 'waylandpp' 'libxkbcommon'
  # gbm
  'libinput'
)

_tag="$pkgver-Matrix"
#_tag="$_major-Matrix"

# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-devel/src/kodi-build/build/download
#
# https://github.com/xbmc/FFmpeg/tags
# https://github.com/xbmc/libdvdcss/tags
# https://github.com/xbmc/libdvdnav/tags
# https://github.com/xbmc/libdvdread/tags
#
# fmt and crossguid can be found http://mirrors.kodi.tv/build-deps/sources/
#
_libdvdcss_version="1.4.2-Leia-Beta-5"
_libdvdnav_version="6.0.0-Leia-Alpha-3"
_libdvdread_version="6.0.0-Leia-Alpha-3"
_ffmpeg_version="4.3.1-Matrix-Alpha1-2"
_fmt_version="6.1.2"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="1.11.0"
_spdlog_version="1.5.0"

source=(
  "${pkgbase%%-*}-$_tag.tar.gz::https://github.com/xbmc/xbmc/archive/$_tag.tar.gz"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/spdlog-$_spdlog_version.tar.gz"
  cpuinfo
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz"
  "fmt-$_fmt_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "spdlog-$_spdlog_version.tar.gz"
)
b2sums=('f61ad74fdcf7254731842feb45897d46291bfe591fed7a1de2d91db36275e3310443fc943f3a93b7ff21f83cad6b4a781b3d60701d6f56a93de231300f5ecd86'
        '283aa2cec0a2200d3569bc280cb9659e9224a6b3a77db8a35b269cd8caf1337ac9d8b92b806df66f63ef7458a46bd6261f0b8b14678b10e26644a79dcbeea5da'
        '7573434a0ae8e8ccabf48173f81fcde29074eb138e119a2ae9156cde3c3d8bfd716f5d0e605b97f2dcac21f570781137c8533c5ae306b51e3905822fda318355'
        '0c206acdaf0776841ab792c74e023af07d9539eb72e03ae164382a31ed950f60e5e15f1d055979d28f1398924471b294d11f064b11b8373353b3962a3777ff3c'
        'c33a2aad8b895be3ea5be76de238680284487d38a8c22ce57f17c3944a6ba214c0dfa9ef1e4717244ff8f70f6dd640b36715842d61ddaed65867a6c096470283'
        '36e7451a8732c62dcbf47e6d287ea582827b6196a468b8648803ea1bc9a37a5f681d87488f748d749183d97783ac7fb47a3f2aeed64fc6a684f9ee85b67ae28d'
        'e6f1f495adf541102e3b5ac11dfd14b770a52e23ef9d613bc6204f6493ff4df4da9ba290ad6c3a7e5c7fcf159cafdf355bfe668a4ddceb4329df934c65966d19'
        'a8b68fcb8613f0d30e5ff7b862b37408472162585ca71cdff328e3299ff50476fd265467bbd77b352b22bb88c590969044f74d91c5468475504568fd269fa69e'
        '69024d77e6e7a5036e24729e337b17680dc3735cb1d209058a88b980989826fe56ff113c1177410106e0f70d827fa82603372277e3bc1aa4d12ffe5bb979af96'
        'bac6c6650f8347458dd2dd66f318b43a769b0896d68f6a6f1310754527a69feaa52b2f6f48d67c7e811c2dafa5d3863a9a07c738df8c12abed2718fb06254b28'
        'e384224db97c88f67cee733d1ea5b0d0a32c532e7931b323724842e4182485d20fc25dc9f419343afdeafab19185c546c329736765c084a95a02a52c9df92679')
prepare() {
  [[ -d kodi-build-x11 ]] && rm -rf kodi-build-x11
  mkdir kodi-build-x11
  [[ -d kodi-build-wayland ]] && rm -rf kodi-build-wayland
  mkdir kodi-build-wayland
  [[ -d kodi-build-gbm ]] && rm -rf kodi-build-gbm
  mkdir kodi-build-gbm

  cd "xbmc-$_tag"

  # detect if building in arch chroot using $pkgname rather than hard coding it into a patch
  if [[ "$srcdir" =~ ^\/build.* ]]; then
    local _find="exec_program(cat ARGS \"/proc/cpuinfo\" OUTPUT_VARIABLE CPUINFO)"
    local _replace="exec_program(cat ARGS \"/build/$pkgname/src/cpuinfo\" OUTPUT_VARIABLE CPUINFO)"
    sed -i s"|$_find|$_replace|" cmake/modules/FindSSE.cmake
  fi

  # needed for `git apply` ... if you know how to avoid this let me know
  git init

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    # only patch subset of patches that begin with 0-9
    [[ $src == [0-9]*.patch ]] || continue
    msg2 "Applying patch $src..."
    # patch will fail if binary diffs are present so use git apply first and only
    # if it fails try patch
    if ! git apply --verbose -p1 < "../$src"; then
      patch -Np1 < "../$src"
    fi
  done

  rm -rf .git
}

build() {
  export PATH="$srcdir/path:$PATH"

  ### Optionally uncomment and setup to your liking
  # export CFLAGS+=" -march=native"
  # export CXXFLAGS="${CFLAGS}"

  echo "building kodi-x11"
  cd "$srcdir/kodi-build-x11"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -DENABLE_INTERNAL_SPDLOG=ON \
    -DENABLE_MYSQLCLIENT=ON \
    -DX11_RENDER_SYSTEM=gl \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz" \
    -DX11_RENDER_SYSTEM=gl \
    ../"xbmc-$_tag"
  make
  make preinstall

  echo "building kodi-wayland"
  cd "$srcdir/kodi-build-wayland"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -DENABLE_INTERNAL_SPDLOG=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz" \
    -DCORE_PLATFORM_NAME=wayland \
    -DWAYLAND_RENDER_SYSTEM=gl \
    ../"xbmc-$_tag"
  make
  make preinstall

  echo "building kodi-gbm"
  cd "$srcdir/kodi-build-gbm"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -DENABLE_INTERNAL_SPDLOG=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz" \
    -DCORE_PLATFORM_NAME=gbm \
    -DGBM_RENDER_SYSTEM=gles \
    ../"xbmc-$_tag"
  make
  make preinstall
}

# kodi
# components: kodi

package_kodi-devel() {
  pkgdesc="Alpha, Beta, or RC versions of the software media player and entertainment hub for digital media"
  depends=(
    'desktop-file-utils' 'hicolor-icon-theme' 'mesa' 'python-pycryptodomex'
    'python-pillow' 'python-simplejson' 'xorg-xdpyinfo'
    'KODI-BIN'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'libplist: AirPlay support'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'upower: Display battery level'
  )
  provides=('xbmc' "kodi=${pkgver}")
  conflicts=('xbmc')
  replaces=('xbmc')

  _components=(
    'kodi'
    'kodi-bin'
  )

  export PATH="$srcdir/path:$PATH"

  cd kodi-build-x11
  # install eventclients
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done

  # remove x11 binaries
  rm "$pkgdir/usr/lib/kodi/"{kodi-x11,kodi-xrandr}
}

# kodi-x11
# components: kodi-bin

package_kodi-devel-x11() {
  pkgdesc="x11 kodi binary"
  provides=('KODI-BIN' "kodi-x11=${pkgver}")
  replaces=('kodi-bin')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libvdpau' 'libxrandr'
    'libxslt' 'lirc' 'mariadb-libs' 'python' 'smbclient' 'taglib'
    'tinyxml' "$pkgbase"
  )

  cd kodi-build-x11
  install -Dm755 kodi-x11 "$pkgdir/usr/lib/kodi/kodi-x11"
  install -Dm755 kodi-xrandr "$pkgdir/usr/lib/kodi/kodi-xrandr"
}

# kodi-wayland
# components: kodi-bin

package_kodi-devel-wayland() {
  pkgdesc="wayland kodi binary"
  provides=('KODI-BIN' "kodi-wayland=${pkgver}")
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon' 'libxslt'
    'lirc' 'mariadb-libs' 'python' 'smbclient' 'taglib' 'tinyxml'
    'waylandpp' "$pkgbase"
  )

  cd kodi-build-wayland
  install -Dm755 kodi-wayland "$pkgdir/usr/lib/kodi/kodi-wayland"
}

# kodi-gbm
# components: kodi-bin

package_kodi-devel-gbm() {
  pkgdesc="gbm kodi binary"
  provides=('KODI-BIN' "kodi-gbm=${pkgver}")
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libinput' 'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon'
    'libxslt' 'lirc' 'mariadb-libs' 'python' 'smbclient' 'taglib'
    'tinyxml' "$pkgbase"
  )

  cd kodi-build-gbm
  install -Dm755 kodi-gbm "$pkgdir/usr/lib/kodi/kodi-gbm"
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-kodi-send

package_kodi-devel-eventclients() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients')
  optdepends=('python: most eventclients are implemented in python')

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-kodi-send'
  )

  export PATH="$srcdir/path:$PATH"

  cd kodi-build-x11
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-tools-texturepacker
# components: kodi-tools-texturepacker

package_kodi-devel-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool"
  provides=("kodi-tools-texturepacker=${pkgver}")
  conflicts=('kodi-tools-texturepacker')
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')

  _components=(
    'kodi-tools-texturepacker'
  )

  cd kodi-build-x11
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-dev
# components: kodi-addon-dev kodi-audio-dev kodi-eventclients-dev kodi-game-dev
#             kodi-inputstream-dev kodi-peripheral-dev kodi-pvr-dev
#             kodi-screensaver-dev kodi-visualization-dev

package_kodi-devel-dev() {
  pkgdesc="Kodi dev files"
  depends=("$pkgbase")
  provides=("kodi-dev=${pkgver}")
  conflicts=('kodi-dev')

  _components=(
    'kodi-addon-dev'
    'kodi-audio-dev'
    'kodi-eventclients-dev'
    'kodi-game-dev'
    'kodi-inputstream-dev'
    'kodi-peripheral-dev'
    'kodi-pvr-dev'
    'kodi-screensaver-dev'
    'kodi-visualization-dev'
  )

  export PATH="$srcdir/path:$PATH"

  cd kodi-build-x11
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}
