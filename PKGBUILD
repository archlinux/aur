# vim:set ts=2 sw=2 et:
# Maintainer graysky <graysky AT archlinux DOT us>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
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

# set this to anything to build with clang rather than with gcc
_clangbuild=

pkgbase=kodi-git
pkgname=("$pkgbase" "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev")
pkgver=r59259.8726f9260c2
pkgrel=1
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libva-vdpau-driver' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest' 'graphviz'
  # wayland
  'wayland-protocols' 'waylandpp' 'libxkbcommon'
  # gbm
  'libinput'
)
[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_gitname='xbmc'
_codename=master
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
_ffmpeg_version="4.4-N-Alpha1"
_fmt_version="8.0.1"
_spdlog_version="1.9.2"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="2.0.0"
_libudfread_version="1.1.0"

options=(!lto)
source=(
  "git://github.com/xbmc/xbmc.git#branch=$_codename"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/spdlog-$_spdlog_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/libudfread-$_libudfread_version.tar.gz"
  'cheat-sse-build.patch'
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz"
  "fmt-$_fmt_version.tar.gz"
  "spdlog-$_spdlog_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "libudfread-$_libudfread_version.tar.gz"
)
b2sums=('SKIP'
        '283aa2cec0a2200d3569bc280cb9659e9224a6b3a77db8a35b269cd8caf1337ac9d8b92b806df66f63ef7458a46bd6261f0b8b14678b10e26644a79dcbeea5da'
        '7573434a0ae8e8ccabf48173f81fcde29074eb138e119a2ae9156cde3c3d8bfd716f5d0e605b97f2dcac21f570781137c8533c5ae306b51e3905822fda318355'
        '0c206acdaf0776841ab792c74e023af07d9539eb72e03ae164382a31ed950f60e5e15f1d055979d28f1398924471b294d11f064b11b8373353b3962a3777ff3c'
        '2c45778e36167a8740f8f724dc8a66ea2491d8343b1f2546027c4dd1a711aa7a8b830defc439006402e141f264532cbc623758dd066b45fc8a09f67ffdc0f9b8'
        'b64a4686050a9edb4e5d3ec28a3727a847105ae0b12a89461841e14d6c9c442e391cdcfbca39b2d141d04cdb10d00516ecc8bf605867c792b7d2d6bc99c7b2bc'
        '8e4cce17887509512c0d3a63485f9271098bdf7f853c2a07adb8d46459c1039d93d16d05cb60963c1bbc754f6af6ba3af1a66c69bc421bf234f676231c8c1315'
        'e6f1f495adf541102e3b5ac11dfd14b770a52e23ef9d613bc6204f6493ff4df4da9ba290ad6c3a7e5c7fcf159cafdf355bfe668a4ddceb4329df934c65966d19'
        'a8b68fcb8613f0d30e5ff7b862b37408472162585ca71cdff328e3299ff50476fd265467bbd77b352b22bb88c590969044f74d91c5468475504568fd269fa69e'
        'ccd827a43da39cf831727b439beed0cea216cdf50dbfe70954854bbe388b2c47ed4e78cc87e3fc0d5568034b13baa2ea96480914cc8129747bccbf8ea928847c'
        'e7fab72ebecb372c54af77b4907e53f77a5503af66e129bd2083ef7f4209ebfbed163ffd552e32b7181829664fff6ab82a1cdf00c81dc6f3cc6bfc8fa7242f6e'
        '6d647177380c619529fb875374ec46f1fff6273be1550f056c18cb96e0dea8055272b47664bb18cdc964496a3e9007fda435e67c4f1cee6375a80c048ae83dd0')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir "$srcdir/kodi-build"

  cd "$_gitname"

  [[ "$_sse_workaround" -eq 1 ]] && patch -p1 -i "$srcdir/cheat-sse-build.patch"

  if [[ -n "$_clangbuild" ]]; then
    msg "Building with clang"
    export CC=clang CXX=clang++
  fi
}

build() {
  cd "$srcdir/kodi-build"

  ### Optionally uncomment and setup to your liking
  # export CFLAGS+=" -march=native"
  # export CXXFLAGS="${CFLAGS}"

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DUSE_LTO=$(nproc)
    -DVERBOSE=ON
    -DENABLE_LDGOLD=OFF
    -DENABLE_EVENTCLIENTS=ON
    -DENABLE_INTERNAL_FFMPEG=ON
    -DENABLE_INTERNAL_FMT=ON
    -DENABLE_INTERNAL_SPDLOG=ON
    -DENABLE_INTERNAL_CROSSGUID=ON
    -DENABLE_INTERNAL_FSTRCMP=ON
    -DENABLE_INTERNAL_FLATBUFFERS=ON
    -DENABLE_INTERNAL_UDFREAD=ON
    -DENABLE_MYSQLCLIENT=ON
    -DENABLE_VAAPI=ON
    -DENABLE_VDPAU=ON
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz"
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz"
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
    -DUDFREAD_URL="$srcdir/libudfread-$_libudfread_version.tar.gz"
    -DAPP_RENDER_SYSTEM=gl
    -DCORE_PLATFORM_NAME="x11 wayland gbm"
  )

  echo "building kodi"
  cmake "${_args[@]}" ../"$_gitname"
  make
}

# kodi
# components: kodi
package_kodi-git() {
  pkgdesc="A software media player and entertainment hub for digital media (master branch)"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libva' 'libvdpau' 'libxslt' 'lirc' 'mariadb-libs'
    'mesa' 'python-pillow' 'python-pycryptodomex' 'python-simplejson'
    'shairplay' 'smbclient' 'sqlite' 'taglib' 'tinyxml'
    'libxrandr' 'libxkbcommon' 'waylandpp' 'libinput'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
    'upower: Display battery level'
  )
  provides=("kodi=${pkgver}" 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  replaces=('kodi' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')
  conflicts=('kodi' 'kodi-x11' 'kodi-wayland' 'kodi-gbm')

  _components=(
    'kodi'
    'kodi-bin'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-kodi-send
package_kodi-git-eventclients() {
  pkgdesc="Kodi Event Clients (master branch)"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients')
  optdepends=(
    'kodi: local machine eventclient use'
    'python: most eventclients are implemented in python'
  )

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-kodi-send'
  )

  cd kodi-build
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

  cd kodi-build
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-dev
# components: kodi-addon-dev kodi-eventclients-dev
package_kodi-git-dev() {
  pkgdesc="Kodi dev files (master branch)"
  depends=('kodi-git')
  provides=("kodi-dev=${pkgver}")
  conflicts=('kodi-dev')

  _components=(
    'kodi-addon-dev'
    'kodi-eventclients-dev'
  )

  cd kodi-build
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}
