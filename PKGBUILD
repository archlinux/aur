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
  "$pkgbase" kodi-bin-devel kodi-wayland-devel kodi-gbm-devel
  kodi-eventclients-devel kodi-tools-texturepacker-devel kodi-dev-devel
)
pkgver=18.5pre31
_major=18.4
pkgrel=1
arch=('x86_64')
url="https://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'doxygen' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python2-pycryptodomex' 'python2-pillow' 'python2-pybluez' 'python2-simplejson'
  'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'git'
  # wayland
  'wayland-protocols' 'waylandpp>=0.2.7-1'
  # gbm
  'libinput' 'libxkbcommon'
)

_codename=Leia
#_tag="$pkgver-$_codename"
_tag="$_major-$_codename"
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
_libdvdcss_version="1.4.2-$_codename-Beta-5"
_libdvdnav_version="6.0.0-$_codename-Alpha-3"
_libdvdread_version="6.0.0-$_codename-Alpha-3"
_ffmpeg_version="4.0.4-$_codename-18.4"
_fmt_version="5.1.0"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="1.9.0"

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
  cpuinfo
  000-fix.building.with.mariadb.patch::https://github.com/wsnipex/xbmc/commit/cd20c8eb8a0394db1f028b118c4ca9b91b7e746a.patch
  001-PR16596.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16596.patch
  002-PR16627.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16627.patch
  003-PR16643.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16643.patch
  004-PR16553.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16553.patch
  005-PR16670.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16670.patch
  006-PR16676.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16676.patch
#  007-PR16077.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16077.patch
  008-PR16673.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16673.patch
  009-PR16674.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16674.patch
  010-PR16689.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16689.patch
  011-PR16714.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16714.patch
  012-PR16681.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16681.patch
  013-PR16720.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16720.patch
  014-PR16737.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16737.patch
  015-PR16733.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16733.patch
  016-PR16743.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16743.patch
  017-PR16750.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16750.patch
  018-PR16751.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16751.patch
  019-PR16609.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16609.patch
  020-PR16725.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16725.patch
  021-PR16628.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16628.patch
  022-PR16605.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16605.patch
  023-PR16785.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16785.patch
  024-PR16801.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16801.patch
  025-PR16792.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16792.patch
  026-PR16783.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16783.patch
  027-PR16675.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16675.patch
  028-PR16824.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16824.patch
  029-PR16843.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16843.patch
  030-PR16832.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16832.patch
  031-PR16856.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16856.patch
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
)
sha256sums=('bf2be186d8ae5b5377e43c06a538012bb9f51a0e98f8244b70a401006861d110'
            '38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d'
            '071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a'
            'a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf'
            'e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2'
            '73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44'
            '3d77d09a5df0de510aeeb940df4cb534787ddff3bb1828779753f5dfa1229d10'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3'
            '27387e49043127f09c5ef0a931fffb864f5730e79629100a6e210b68a1b9f2c1'
            '849daf1d5b081ef6d0e428bbc7d448799fc43a8ac9e79cd7513de0eb5a91b0bb'
            'd5eead90e570a96d4ed947e7d671cf7b1794fca12c3b834f45a9628fe1a8e9ab'
            '0cea951df699da5281a99c1280de0f5256b5e5087f89dc62aecf2d6584e4bf79'
            '2c9eb63e1a1a9bee966b1cf7a31aac40275ba3a7c96bb72604d1fbbf1fd66629'
            '1f79fe93b4b42739a89e99b9076ccbc5934539a046512c22e7a0a78d1e90b402'
            '8e88385024428c83775c5ec4f6bc0033ad7e9b70b5fca16f1122f5e74c28f3ec'
            '2e24678534abd4442edf06e3eb4dc4aa61222511927e01fa9c510ce9c5c0e405'
            '2db519f89d8892051a2ebf57e5a8871cb439388d19cf03e183b7d7dbe51feb36'
            '2b699e313c352fa403e44282f72da75aeb93c798005be794d73849b88d6a76c4'
            'c30127efab572f1c0e4aa44f7b8fe427b474b723b51711f960a38a68b2d8d0a2'
            '05e1286152fd3997631635466195d46813bc55bf4f4cb8a073c9904efc4fe5d0'
            '4cb82b03a0ea3c022f53d741af60ff23ccb144f9d61a6bdc068fbe078486c31f'
            'b497d43cc1e9096731197fd90e620da8ce634cac7b918a62082a414d8a7ed187'
            '30c2d43201401c2f9bb171fba37cea4e9eb71ad920400e21b80fb0142d6fbd12'
            'e493c9de76c80fe8b91351f38f1312ff5bf9097d42e243dda08ea31afac4e926'
            '46d137acd55e85d8e9eb494797d51f4643ab53282ba1660e966fcd33506aae49'
            'c19ddf56276c2c069d0a8e471526f1aaf61266c8e0e3db2c8298d813d859b246'
            '59005a91f5293dfe022b7f20cf3747a94031016235bf8c289fc3449ce88c6fe4'
            'e4dda581d215fe766b03a1b041420e9f014ae102a63d49c68ce404f1d2711ec9'
            '0eb079db9dc40c621dfb60cfb3d0d923a36ffa269fe9605c4a3fd575471fadd1'
            '224748c4ef223237e396e4f847c8b8d642064c698c7001529545b76d5c745fcc'
            'c348eae1082ef5d0510839c3c403d40fe2f1d6b723ea0958a438859aa46cd90a'
            '7bc8e63ed615ba4e7d21688bf74ea94a00136aac7931dba611aa05c4e749f1f8'
            'cf5338673616aa9dbedf76ad9d27099acd3a62fa459c6ebb2eb137978eb8bdbe'
            '753bb9ecedb8b01525e7e9eafb59125a1ef099848154fd206b95e39ce2ef2c86'
            '4ad439e04a2884f0b3611eae70ed19eac494e4c992b32d07839ed65a8575582a'
            '5aab7f7561a139528bf4a46be32ac284a02dc48b260054d78dfbee6e692a1d49'
            '9c501428e712ed7e217bf5ef093011836d0238be47d702bd373d6ac3199c6665'
            'b3069f7494f93f3e6e59cdeeaf41f2307caf4497b058fcaf2d1f90210697016b'
            '5fea650c2105270584b487f470d572885101efc7406803ff698d0c9acfc7d4da'
            '72edf2c267e87670cce5b91257d820235edd64a20c14e9b44f760fdf9ae933a3')

prepare() {
  # force python 'binary' as python2
  [[ -d "$srcdir/path" ]] && rm -rf "$srcdir/path"
  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

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

  msg2 "building kodi-x11"
  cd "$srcdir/kodi-build-x11"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    -DENABLE_MARIADBCLIENT=ON \
    -DENABLE_MYSQLCLIENT=OFF \
    ../"xbmc-$_tag"
  make
  make preinstall

  msg2 "building kodi-wayland"
  cd "$srcdir/kodi-build-wayland"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    -DCORE_PLATFORM_NAME=wayland \
    -DWAYLAND_RENDER_SYSTEM=gl \
    ../"xbmc-$_tag"
  make
  make preinstall

  msg2 "building kodi-gbm"
  cd "$srcdir/kodi-build-gbm"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
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
    'desktop-file-utils' 'hicolor-icon-theme' 'mesa' 'python2-pycryptodomex'
    'python2-pillow' 'python2-simplejson' 'xorg-xdpyinfo'
    'kodi-bin'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python2-pybluez: Bluetooth support'
    'libplist: AirPlay support'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'upower: Display battery level'
  )
  provides=("kodi=${pkgver}")
  conflicts=('kodi')

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

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | \
    while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done

  # remove x11 binaries
  rm "$pkgdir/usr/lib/kodi/"{kodi-x11,kodi-xrandr}
}

# kodi-x11
# components: kodi-bin

package_kodi-bin-devel() {
  pkgdesc="x11 kodi binary"
  conflicts=('kodi-bin')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libvdpau' 'libxrandr'
    'libxslt' 'lirc' 'mariadb-libs' 'python2' 'smbclient' 'taglib'
    'tinyxml' "$pkgbase"
  )
  provides=("kodi-bin=${pkgver}")

  cd kodi-build-x11
  install -Dm755 kodi-x11 "$pkgdir/usr/lib/kodi/kodi-x11"
  install -Dm755 kodi-xrandr "$pkgdir/usr/lib/kodi/kodi-xrandr"
}

# kodi-wayland
# components: kodi-bin

package_kodi-wayland-devel() {
  pkgdesc="wayland kodi binary"
  provides=("kodi-bin=${pkgver}" "kodi-wayland")
  conflicts=('kodi-wayland')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon' 'libxslt'
    'lirc' 'mariadb-libs' 'python2' 'smbclient' 'taglib' 'tinyxml'
    'waylandpp>=0.2.7-1' "$pkgbase"
  )

  cd kodi-build-wayland
  install -Dm755 kodi-wayland "$pkgdir/usr/lib/kodi/kodi-wayland"
}

# kodi-gbm
# components: kodi-bin

package_kodi-gbm-devel() {
  pkgdesc="gbm kodi binary"
  provides=("kodi-bin=${pkgver}" 'kodi-gbm')
  conflicts=('kodi-gbm')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libinput' 'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon'
    'libxslt' 'lirc' 'mariadb-libs' 'python2' 'smbclient' 'taglib'
    'tinyxml' "$pkgbase"
  )

  cd kodi-build-gbm
  install -Dm755 kodi-gbm "$pkgdir/usr/lib/kodi/kodi-gbm"
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-kodi-send

package_kodi-eventclients-devel() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients')
  optdepends=('python2: most eventclients are implemented in python2')

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

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | \
    while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-tools-texturepacker
# components: kodi-tools-texturepacker

package_kodi-tools-texturepacker-devel() {
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

package_kodi-dev-devel() {
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

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | \
    while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}
