# vim:set ts=2 sw=2 et:
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

pkgbase=kodi-git
pkgname=(
  "$pkgbase" "$pkgbase-x11" "$pkgbase-wayland" "$pkgbase-gbm"
  "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev"
)
pkgver=r56885.b783517b55d
pkgrel=1
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

_gitname='xbmc'
_sse_workaround=1

# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-git/src/kodi-build/build/download
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
_ffmpeg_version="4.3.1-Matrix-Beta1"
_fmt_version="6.1.2"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="1.11.0"
_spdlog_version="1.5.0"

source=(
  "git://github.com/xbmc/xbmc.git#branch=master"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/spdlog-$_spdlog_version.tar.gz"
  cheat-sse-build.patch
  0001-Revert-jsonrpc-remove-ambiguous-and-duplicate-Player.patch
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
b2sums=('SKIP'
        '283aa2cec0a2200d3569bc280cb9659e9224a6b3a77db8a35b269cd8caf1337ac9d8b92b806df66f63ef7458a46bd6261f0b8b14678b10e26644a79dcbeea5da'
        '7573434a0ae8e8ccabf48173f81fcde29074eb138e119a2ae9156cde3c3d8bfd716f5d0e605b97f2dcac21f570781137c8533c5ae306b51e3905822fda318355'
        '0c206acdaf0776841ab792c74e023af07d9539eb72e03ae164382a31ed950f60e5e15f1d055979d28f1398924471b294d11f064b11b8373353b3962a3777ff3c'
        '49415f76fd2a888b0efadb19597bd89db65c3d9e1224ab529ff0d73ab5734a23982b4d4905ddeb105ce59a816c4642cdb9f5568b0c39c29f5fb9431f9623d4ec'
        '36e7451a8732c62dcbf47e6d287ea582827b6196a468b8648803ea1bc9a37a5f681d87488f748d749183d97783ac7fb47a3f2aeed64fc6a684f9ee85b67ae28d'
        'e6f1f495adf541102e3b5ac11dfd14b770a52e23ef9d613bc6204f6493ff4df4da9ba290ad6c3a7e5c7fcf159cafdf355bfe668a4ddceb4329df934c65966d19'
        'a8b68fcb8613f0d30e5ff7b862b37408472162585ca71cdff328e3299ff50476fd265467bbd77b352b22bb88c590969044f74d91c5468475504568fd269fa69e'
        '69024d77e6e7a5036e24729e337b17680dc3735cb1d209058a88b980989826fe56ff113c1177410106e0f70d827fa82603372277e3bc1aa4d12ffe5bb979af96'
        'bac6c6650f8347458dd2dd66f318b43a769b0896d68f6a6f1310754527a69feaa52b2f6f48d67c7e811c2dafa5d3863a9a07c738df8c12abed2718fb06254b28'
        '6d647177380c619529fb875374ec46f1fff6273be1550f056c18cb96e0dea8055272b47664bb18cdc964496a3e9007fda435e67c4f1cee6375a80c048ae83dd0'
        '05f4158b4006822bc93d77aa13fc77ff1f266b840594d18882bab751d81a772ef99676c5ffc55fa7e977bb1efb66035cdf2bbdfa4a98ff50b9c3770e1c8b8cdc')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ -d kodi-build-x11 ]] && rm -rf kodi-build-x11
  mkdir kodi-build-x11
  [[ -d kodi-build-wayland ]] && rm -rf kodi-build-wayland
  mkdir kodi-build-wayland
  [[ -d kodi-build-gbm ]] && rm -rf kodi-build-gbm
  mkdir kodi-build-gbm

  cd "$_gitname"
  [[ "$_sse_workaround" -eq 1 ]] && patch -p1 -i "$srcdir/cheat-sse-build.patch"

  # this causes issues for the official iOS app
  # see: https://github.com/xbmc/Official-Kodi-Remote-iOS/issues/95
  patch -Np1 -i ../0001-Revert-jsonrpc-remove-ambiguous-and-duplicate-Player.patch
}

build() {
  export PATH="$srcdir/path:$PATH"
  ### Optionally uncomment and setup to your liking
  # export CFLAGS+=" -march=native"
  # export CXXFLAGS="${CFLAGS}"

  _args=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DENABLE_EVENTCLIENTS=ON
    -DENABLE_INTERNAL_FFMPEG=ON
    -DENABLE_INTERNAL_FMT=ON
    -DENABLE_INTERNAL_CROSSGUID=ON
    -DENABLE_INTERNAL_FSTRCMP=ON
    -DENABLE_INTERNAL_FLATBUFFERS=ON
    -DENABLE_INTERNAL_SPDLOG=ON
    -DENABLE_MYSQLCLIENT=ON
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz"
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz"
  )

  echo "building kodi-x11"
  cd "$srcdir/kodi-build-x11"
  _args+=(
    -DCORE_PLATFORM_NAME=x11
    -DAPP_RENDER_SYSTEM=gl
  )

  cmake "${_args[@]}" ../xbmc
  make
  make preinstall

  echo "building kodi-wayland"
  cd "$srcdir/kodi-build-wayland"
  _args+=(
    -DCORE_PLATFORM_NAME=wayland
    -DAPP_RENDER_SYSTEM=gl
  )

  cmake "${_args[@]}" ../xbmc
  make
  make preinstall

  echo "building kodi-gbm"
  cd "$srcdir/kodi-build-gbm"
  _args+=(
    -DCORE_PLATFORM_NAME=gbm
    -DAPP_RENDER_SYSTEM=gles
  )

  cmake "${_args[@]}" ../xbmc
  make
  make preinstall
}

# kodi
# components: kodi

package_kodi-git() {
  pkgdesc="A software media player and entertainment hub for digital media (master branch)"
  depends=(
    'desktop-file-utils' 'hicolor-icon-theme' 'mesa' 'python-pycryptodomex'
    'python-pillow' 'python-simplejson' 'xorg-xdpyinfo' 'shairplay'
    'KODI-GIT-BIN' 'libplist'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'upower: Display battery level'
  )
  provides=('xbmc' "kodi=${pkgver}")
  conflicts=('xbmc' 'kodi')
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

package_kodi-git-x11() {
  pkgdesc="x11 kodi binary"
  provides=('KODI-GIT-BIN' "kodi-x11=${pkgver}")
  conflicts=('kodi-x11')
  replaces=('kodi-bin')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libvdpau' 'libxrandr'
    'libxslt' 'lirc' 'mariadb-libs' 'python' 'smbclient' 'taglib' 'libplist'
    'tinyxml' "$pkgbase"
  )

  cd kodi-build-x11
  install -Dm755 kodi-x11 "$pkgdir/usr/lib/kodi/kodi-x11"
  install -Dm755 kodi-xrandr "$pkgdir/usr/lib/kodi/kodi-xrandr"
}

# kodi-wayland
# components: kodi-bin

package_kodi-git-wayland() {
  pkgdesc="wayland kodi binary"
  provides=('KODI-GIT-BIN' "kodi-wayland=${pkgver}")
  conflicts=('kodi-wayland')
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

package_kodi-git-gbm() {
  pkgdesc="gbm kodi binary"
  provides=('KODI-GIT-BIN' "kodi-gbm=${pkgver}")
  conflicts=('kodi-gbm')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libinput' 'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon'
    'libxslt' 'lirc' 'mariadb-libs' 'python' 'smbclient' 'taglib' 'libplist'
    'tinyxml' "$pkgbase"
  )

  cd kodi-build-gbm
  install -Dm755 kodi-gbm "$pkgdir/usr/lib/kodi/kodi-gbm"
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-kodi-send

package_kodi-git-eventclients() {
  pkgdesc="Kodi Event Clients (master branch)"
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

package_kodi-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool (master branch)"
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

package_kodi-git-dev() {
  pkgdesc="Kodi dev files (master branch)"
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
