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
  "$pkgbase" "$pkgbase-bin" "$pkgbase-wayland" "$pkgbase-gbm"
  "$pkgbase-eventclients" "$pkgbase-tools-texturepacker" "$pkgbase-dev"
)
pkgver=18.3rc1pre36
_major=18.2
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
  'python2-pycryptodome' 'python2-pillow' 'python2-pybluez' 'python2-simplejson'
  'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'git'
  # wayland
  'wayland-protocols' 'waylandpp'
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
_ffmpeg_version="4.0.3-$_codename-18.2"
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
  001-PR15957.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15957.patch
  002-PR15972.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15972.patch
  003-PR15974.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15974.patch
  004-PR15978.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15978.patch
  005-PR16016.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16016.patch
  006-PR16014.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16014.patch
  007-PR16027.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16027.patch
  008-PR16037.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16037.patch
  009-PR16042.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16042.patch
  010-PR16030.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16030.patch
  011-PR16055.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16055.patch
  012-PR16067.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16067.patch
  013-PR16086.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16086.patch
  014-PR16082.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16082.patch
  015-PR16054.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16054.patch
  016-PR16143.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16143.patch
  017-PR16147.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16147.patch
  018-PR16148.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16148.patch
  019-PR16173.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16173.patch
  020-PR16137.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16137.patch
  021-PR16051.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16051.patch
  022-PR16192.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16192.patch
  023-PR16060.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16060.patch
  024-PR16202.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16202.patch
  025-PR16122.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16122.patch
  026-PR16190.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16190.patch
  027-PR15941.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15941.patch
  028-PR16221.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16221.patch
  029-PR16208.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16208.patch
  030-PR16230.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16230.patch
  031-PR16243.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16243.patch
  032-PR16224.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16224.patch
  033-PR16260.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16260.patch
  034-PR16281.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16281.patch
  035-PR16274.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16274.patch
  036-PR16285.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/16285.patch
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
sha256sums=('07b8cffc396473523a51354dc95dfffb54a6a456b82cda7ad67dc2c052d99f64'
            '38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d'
            '071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a'
            'a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf'
            '68535cc2a000946b62ce4be6edf7dda7900bd524f22bcb826800b94f4a873314'
            '73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44'
            '3d77d09a5df0de510aeeb940df4cb534787ddff3bb1828779753f5dfa1229d10'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3'
            '27387e49043127f09c5ef0a931fffb864f5730e79629100a6e210b68a1b9f2c1'
            '849daf1d5b081ef6d0e428bbc7d448799fc43a8ac9e79cd7513de0eb5a91b0bb'
            'e0c0a22227db846efb0ee91c6bbe70f892e5f0802715f831b5cdc08c280fd3ae'
            'e406ef082d751de376a55fbafd983f62712fb73c0020cf5ed354df58c0c869c6'
            '90842c8b91ed078cee10ef7409380001b431d193a695170ba80602dbb36c63ce'
            '779caa109dafade71f3b67b1b4c80af364fcccd148e8ee3d09b79270941f27de'
            '305fd069a5e624e05f4b610f2439404c5a733bd8d6d2b5809205310e5349c9cb'
            '7525730949921fa935bc4c0324dafd2b0fe7cda2212131cf0d7edd3fa74c9423'
            '74c80567b98685508123ce5082dd8bab5c835e46f322673c92d896c5bc5e8b5a'
            '8b17b35c6ec464eae51b31ca7b17428fa6cb81223b8d244585eb3727eec89041'
            '09948aedd11f4f10e8c88434713c3b004de2396ea0ec41197e9eef6c08650ba1'
            '8f029aa932ef2f97438f0387bc30ade8cf6fecc0b03391d70984ff3b19dc0cac'
            '6f70b9ebb08f08964b586dbaeaa9bb9ed7f0d18c93c970297b48b0a11b2de91c'
            'a6889c224c65c0184179d67d1f4b1a02f04444120dbf3c8f415110bc0fe3dece'
            '7ddfca006b6b306a410e5677bf797305d4e8a999a49176d00eed18446946d74b'
            'cbed8de6937ca6a6eb835cefb01dfa8ebba82b60cf4a6cc7d926fab92d6ab7b2'
            '04832b1066cc5066aa059fa21a5b430e3d5bfe3976d99c87b4b547ff4a947ed5'
            '0818a4cd683a3a1e5dff2f1c07dd3a4e1e20dbef81f2417e4018168f08f80469'
            'b65df19f1e31d5427f78b200e17ecfe264b35b5310a1ecbec9184b2009efa748'
            '6d5bc5a6cc3fae86b72991c0ed475fe3880e585513dd7231f7ecab052460f107'
            '7762041da4e8b74e55216f7408b1cf1cd1f5d685e74a6dc99c5e578e6d387473'
            '5e8eee40c767c028f17eb57b99a678523bf0f2ed18d558f8c7575181d9031879'
            'f4600e930c8c1fd17cbeafd3e45c17a2d82e2b9b6d6a70bb50ae844600edb616'
            '627272697cca1a67fad813f2f367a186769b76abb3ef4b46a9c89c34ef059aa8'
            'baaef4be7f2197e371c054b287043527a1756ab2375a3cb9ab803d87f1fc2f8a'
            'd8a258d92c68f303c57cc4868770e55729deeaffa1eaacf4ac918317bdbc7b65'
            '6295df9ed29fffe783c3d0ca930b58c56cdc79bea61694cdb62a8896fb782bdf'
            '018e198bea1cb39671e45d30be20ace07de96d793981a009bb1250d6ddc16657'
            'a24a242f8a83d46db104c3ef1383e80f44ccf8d8d079fcef16762d0865cb7ac7'
            '47caa3fdc06348f56e14644301119402240acc467e82383d852739bfd0b99f5a'
            '52469bb23c62db840bf370b304f44bba286043ebc0f6ede22ae05a4f91ee2946'
            '34958d8cd636c4ec74b315e34e137a9b7363f61ad1253c62d09347119eff197d'
            '8b1d8d45ff71286ea017529453e10d4e8392ad651e821dc53b9cbe207ce9fe2f'
            '7c26f4f0f8171c43f89f2bb4593e779cd20a1c556ca8e95ddc4b7f75770fee61'
            '1b2b0218874e768ed69261ad4433f812ae1b5b73b8db01582a6c66926e4ea0d3'
            'b3994b4785a99da954362f15765eaa6080bfff727f0905bd470bcb1df4f91975'
            '9aa7fdd31ddd80d739c8c66964e4fce7949b04f2ce0d140b1a1fa21ded02b13f'
            'b683b280d039819081090b9729ee1ba51da3f22bb3b8bc5b0714107d2218dab6')

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
    'desktop-file-utils' 'hicolor-icon-theme' 'mesa' 'python2-pycryptodome'
    'python2-pillow' 'python2-simplejson' 'xorg-xdpyinfo'
    "$pkgbase-bin"
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

package_kodi-devel-bin() {
  pkgdesc="x11 kodi binary"
  conflicts=('kodi-bin')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libvdpau' 'libxrandr'
    'libxslt' 'lirc' 'mariadb-libs' 'python2' 'smbclient' 'taglib'
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
  provides=("$pkgbase-bin=${pkgver}")
  conflicts=('kodi-wayland')
  depends=(
    'bluez-libs' 'curl' 'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec'
    'libmicrohttpd' 'libnfs' 'libpulse' 'libva' 'libxkbcommon' 'libxslt'
    'lirc' 'mariadb-libs' 'python2' 'smbclient' 'taglib' 'tinyxml'
    'waylandpp' "$pkgbase"
  )

  cd kodi-build-wayland
  install -Dm755 kodi-wayland "$pkgdir/usr/lib/kodi/kodi-wayland"
}

# kodi-gbm
# components: kodi-bin

package_kodi-devel-gbm() {
  pkgdesc="gbm kodi binary"
  provides=("$pkgbase-bin=${pkgver}" 'kodi-gbm')
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

package_kodi-devel-eventclients() {
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

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | \
    while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}
