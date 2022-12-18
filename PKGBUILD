# This PKGBUILD is based on kodi-rpi-git from archlinuxarm: https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/kodi-rpi-git/PKGBUILD
# Patches are from the Libreelec project
# Maintainer: mmustermann
# Contributor graysky <therealgraysky AT proton DOT me>
# Contributor BlackIkeEagle < ike DOT devolder AT gmail DOT com>
# Contributor Kevin Mihelich <kevin@archlinuxarm.org>
# Contributor BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor Oleg Rakhmanov <oleg [at] archlinuxarm [dot] com>
# Contributor tomasgroth at yahoo.dk
# Contributor WarheadsSE <max@warheads.net>
# Contributor Adrian Fedoreanu <adrian [dot] fedoreanu [at] gmail [dot] com>

pkgbase=kodi-rockpro64-git
pkgname=(
  'kodi-rockpro64-git'
  'kodi-rockpro64-git-eventclients' 'kodi-rockpro64-git-tools-texturepacker' 'kodi-rockpro64-git-dev'
)

_commitnumber=61791
_commit=c19adeae47e70143265395f7ddb56cfbffd14647
_libreelec_patch_commit=9f64444be3dc4e9d50e0a40928787aa079ef0432

# set this to anything to build with clang
# recommend manually setting -DUSE_LTO=OFF to -DUSE_LTO=$(nproc) in build()
_clangbuild=

pkgver="20.x.$_commitnumber.${_commit:0:10}"
pkgrel=1
arch=('armv7h' 'aarch64')
url="https://github.com/xbmc/xbmc"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'dav1d' 'doxygen' 'git' 'glew'
  'gperf' 'hicolor-icon-theme' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec-rpi' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse'
  'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm'
  'python-pycryptodomex' 'python-pillow' 'python-pybluez'
  'python-simplejson' 'shairplay' 'smbclient' 'taglib' 'tinyxml' 'swig'
  'upower' 'giflib' 'rapidjson' 'ghostscript' 'meson' 'gtest' 'graphviz'
  'libinput' 'libxkbcommon' 'flatbuffers' 'pipewire' 'pcre' 'patchutils'
)
[[ -n "$_clangbuild" ]] && makedepends+=('clang' 'lld' 'llvm')

_codename=Nexus
_init_version=1.136
_libdvdcss_version="1.4.3-Next-Nexus-Alpha2-2"
_libdvdnav_version="6.1.1-Next-Nexus-Alpha2-2"
_libdvdread_version="6.1.3-Next-Nexus-Alpha2-2"
_ffmpeg_version="4.4.1-Nexus-Alpha1"
_fmt_version="9.1.0"
_spdlog_version="1.10.0"
_crossguid_version="ca1bf4b810e2d188d04cb6286f957008ee1b7681"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="2.0.0"
_libudfread_version="1.1.2"
_rapidjson_version="1.1.0"
_name="gbm_nexus-$pkgver-$_codename"
source=(
  "xbmc-$pkgver.tar.gz::https://github.com/xbmc/xbmc/archive/$_commit.tar.gz"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/spdlog-$_spdlog_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/libudfread-$_libudfread_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
#  "http://mirrors.kodi.tv/build-deps/sources/rapidjson-$_rapidjson_version.tar.gz"
  "ArchARM-kodi-init-v$_init_version.tar.gz::https://github.com/graysky2/kodi-standalone-service/archive/v$_init_version.tar.gz"
  kodi.config.txt
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/multimedia/ffmpeg/patches/v4l2-drmprime/ffmpeg-001-v4l2-drmprime.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/ffmpeg/ffmpeg-0002-WIP-deint-filter.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/ffmpeg/ffmpeg-0003-libavfilter-v4l2deinterlace-dequeue-both-destination.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/ffmpeg/ffmpeg-0006-deint_v4l2m2m-increase-input-and-output-buffers.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/projects/Rockchip/patches/ffmpeg/ffmpeg-0006-libavfilter-v4l2deinterlace-support-more-formats-aut.patch"

  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0001-WIP-DVDVideoCodecDRMPRIME-add-support-for-filters.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0002-WIP-DRMPRIME-deinterlace-filter.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0003-DVDVideoCodecDRMPRIME-Avoid-exception-with-AV_PIX_FM.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0004-DVDVideoCodecDRMPRIME-Leave-deinterlace-filter-activ.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0005-SetVideoInterlaced-Set-and-unset-deinterlace-method-.patch"
  "https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/drmprime-filter/0006-DVDVideoCodecDRMPRIME-Close-deinterlace-filter-on-er.patch"

  "0001-fix-mesa-22.3.0-build.patch::https://github.com/LibreELEC/LibreELEC.tv/raw/${_libreelec_patch_commit}/packages/mediacenter/kodi/patches/kodi-100.01.fix-mesa-22.3.0-build.patch"
)
backup=(boot/kodi.config.txt etc/conf.d/kodi-standalone)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
#  "ffmpeg-$_ffmpeg_version.tar.gz"
  "fmt-$_fmt_version.tar.gz"
  "spdlog-$_spdlog_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
  "libudfread-$_libudfread_version.tar.gz"
#  "rapidjson-$_rapidjson_version.tar.gz"
)
sha256sums=('a8092bfde254c6dc6ff61da1c89cc49ed52cca8fa836dcc48edfbd01ae826929'
            'f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e'
            '584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc'
            '719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62'
            'abbce62231baffe237e412689c71ffe01bfc83135afd375f1e538caae87729ed'
            '5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2'
            '6be27e0b3a4907f0cd3cfadec255ee1b925569e1bd06e67a4d2f4267299b69c4'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '697f91700237dbae2326b90469be32b876b2b44888302afbc7aceb68bcfe8224'
            '2bf16726ac98d093156195bb049a663e07d3323e079c26912546f4e05c77bac5'
            '9ddb9031798f4f8754d00fca2f1a68ecf9d0f83dfac7239af1311e4fd9a565c4'
            'b94c70baa45e30346224ceecfab031dd183e09303b1f97d6522f9941da9b0067'
            '92d063169017bf9e1770d8a7cce77c0c55d197692d10820a7e4aecad9e58178c'
            '050db02dabea05e4b651df1f2107fe062c197391e9e9eac519a3eac9c3c5fc5b'
            'b9304095fa7e8fa2585dd353c975f0fdaee00914cb55934d8bf82b91dff1795a'
            '2a218cce1b7514931c458a1ae886d27531b9d4be8253eefb16f8083450cbfc93'
            'a5dbfd115caae0c4d53bd8f3aa65ea36db8b7e2891a33c72cd03ceaaa459d9b1'
            'b88708f4eb3ff2fe01c01b5d14ad7c4b58e2c2951ac1362292f3db9437bf9c68'
            '2d320a49b5f11a8543c54e891c82978e199ea5bbe235ea56b3aec8df9ff804b5'
            '38cc2f33ab5ee09bd9eea5b661268f20ecf132d3e7f9789286a0e30d83f811fd'
            'a8523e228fabf7869ce31195c2b88f0de50773fa005086a64e6d1dc2f5b808a4'
            '2fbda3ecd0065373c608d15f7cf94052879c9d39ddd4df78db46c287871c9f56'
            '3e441417b30d9f398b9f041d28a6404d5b52903b98eff78539f5927f2179471b'
            '63066f9a1cc5a5eda418165f0e338553c9d86a23cf4b92a29bb725e3c3f15c72'
            '0349babb16dd6572dc51fade9eda53dc19e4528839651ac518a6f7ca80e1d902'
            '4ef526800e59f733ad7185d1487b3ac4dd6da4b0d9753be98a9347f13cf979f1')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir "$srcdir/kodi-build"

  cd FFmpeg-${_ffmpeg_version}

  for file in ../ffmpeg-*.patch
  do
    sed 's|^\+#include <drm_fourcc.h>$|+#include <libdrm/drm_fourcc.h>|g' ${file} > ${file}.mod
  done

  git apply -v ../ffmpeg-001*.patch.mod
  git apply -v ../ffmpeg-0002*.patch.mod
  git apply -v ../ffmpeg-0003*.patch.mod
  git apply -v ../ffmpeg-0006*.patch.mod

  cd ..
  cd xbmc-${_commit}

  git apply -v ../0001*.patch
  git apply -v ../0002*.patch
  git apply -v ../0003*.patch
  git apply -v ../0004*.patch
  git apply -v ../0005*.patch
  git apply -v ../0006*.patch
}

build() {
  cd "$srcdir/kodi-build"

  # -march= defined in /etc/makepkg.conf will override the value for -mcpu we
  # uses here so unset them and redefine below
  unset CFLAGS CXXFLAGS

  if [[ $CARCH = "armv7h" ]]; then
    # we use -mcpu=cortex-a53 rather than cortex-a72 to maximize RPi 3B and RPi 4B/400 compatibility
    # in a single package which is consistent with how LibreELEC is currently built, see:
    # https://github.com/LibreELEC/LibreELEC.tv/commit/8e6605f6da56f25a00272b1cbacb93d40200153f#commitcomment-46341034
    CFLAGS="-mcpu=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard"
  elif [[ $CARCH = "aarch64" ]]; then
    # note that we use a value of cortex-a53 here to allow RPi3 and RPi4 to use the same package
    # consistent with rationale of previous comment
    CFLAGS="-mcpu=cortex-a53"
  fi

  export CFLAGS+=" -O2 -pipe -fstack-protector-strong -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection"
  export CXXFLAGS+="${CFLAGS} -Wp,-D_GLIBCXX_ASSERTIONS"

  if [[ -n "$_clangbuild" ]]; then
    export CC=clang CXX=clang++
    # depending on your build system, optionally redefine DISTCC_HOSTS
    # since current toolchain does not include clang support x86_64 volunteers
    #unset DISTCC_HOSTS
    #export DISTCC_HOSTS="localhost/5 10.0.1.103/5:3636"
  fi

  _args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DUSE_LTO=OFF
    -DENABLE_LDGOLD=OFF
    -DENABLE_EVENTCLIENTS=ON
    -DENABLE_INTERNAL_FFMPEG=ON
    -DENABLE_INTERNAL_FMT=ON
    -DENABLE_INTERNAL_SPDLOG=ON
    -DENABLE_INTERNAL_CROSSGUID=ON
    -DENABLE_INTERNAL_FSTRCMP=ON
#    -DENABLE_INTERNAL_FLATBUFFERS=ON
    -DENABLE_INTERNAL_UDFREAD=ON
    -DENABLE_MYSQLCLIENT=ON
    -DENABLE_VAAPI=OFF
    -DENABLE_VDPAU=OFF
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz"
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz"
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz"
    -DFFMPEG_URL="$srcdir/FFmpeg-4.4.1-Nexus-Alpha1"
#    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz"
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz"
    -DSPDLOG_URL="$srcdir/spdlog-$_spdlog_version.tar.gz"
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz"
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz"
    -DUDFREAD_URL="$srcdir/libudfread-$_libudfread_version.tar.gz"
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz"
#    -DRAPIDJSON_URL="$srcdir/rapidjson-$_rapidjson_version.tar.gz"
    -DVERBOSE=ON
    -DAPP_RENDER_SYSTEM=gles
    -DCORE_PLATFORM_NAME="x11 gbm"
  )

  cmake "${_args[@]}" ../"xbmc-$_commit"
  make
}

package_kodi-rockpro64-git() {
  pkgdesc="Media player and entertainment hub with hw accel for PINE64's ROCKPro64"
  depends=(
    'bluez-libs' 'curl' 'dav1d' 'desktop-file-utils' 'hicolor-icon-theme'
    'lcms2' 'libass' 'libbluray' 'libcdio' 'libcec-rpi' 'libmicrohttpd' 'libnfs'
    'libplist' 'libpulse' 'libxslt' 'lirc' 'mariadb-libs' 'mesa'
    'python-pillow' 'python-pycryptodomex' 'python-simplejson'
    'shairplay' 'smbclient' 'sqlite' 'taglib' 'tinyxml'
    'libinput' 'libxkbcommon' 'polkit' 'linux>=5.4.35' 'lzo' 'flatbuffers' 'pipewire' 'pcre'
  )
  [[ -n "$_clangbuild" ]] && depends+=('glu')

  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'linux-rpi: HW accelerated decoding'
    'python-pybluez: Bluetooth support'
    'pulseaudio: PulseAudio support'
  )
  install='kodi.install'
  provides=('xbmc' "kodi=${pkgver}" "kodi-common=${pkgver}")
  conflicts=('xbmc' 'kodi' 'arm-mem-git' 'shairplay-git' 'kodi-rbp4-git' 'kodi-rpi' 'kodi-rpi-legacy' 'kodi-rpi-git')
  replaces=('xbmc-rbp-git' 'kodi-rbp4-git')

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

  # setup video drivers for kodi-gbm
  install -Dm0644 "$srcdir/kodi.config.txt" "$pkgdir/boot/kodi.config.txt"

  # rpi4 wants 512 MB of memory
  # this might be a problem for RPi3 ???
  sed -i 's/@@@/512/' "$pkgdir/boot/kodi.config.txt"

  _initshit="$srcdir/kodi-standalone-service-$_init_version/arm"

  # fix permissions necessary for accelerated video playback
  install -Dm0644 "$_initshit/udev/99-kodi.rules" "$pkgdir/usr/lib/udev/rules.d/99-kodi.rules"

  # environment vars
  install -Dm644 "${_initshit/\/arm}"/common/kodi-standalone "$pkgdir/etc/conf.d/kodi-standalone"

  # systemd manages kodi user
  install -Dm644 "$_initshit"/init/sysusers.conf "$pkgdir/usr/lib/sysusers.d/kodi.conf"
  install -Dm644 "$_initshit"/init/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/kodi.conf"

  # systemd service and polkit rules
  install -Dm0644 "$_initshit/init/kodi.service" "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -Dm0644 "$_initshit/polkit/polkit.rules" "$pkgdir/usr/share/polkit-1/rules.d/10-kodi.rules"
  chmod 0750 "$pkgdir/usr/share/polkit-1/rules.d/"

  # man page
  install -Dm0644 "$_initshit/doc/kodi.service.1" "$pkgdir/usr/share/man/man1/kodi.service.1"
}

package_kodi-rockpro64-git-eventclients() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients' 'kodi-eventclients-rbp4-git' 'kodi-rpi-eventclients' 'kodi-rpi-legacy-eventclients' 'kodi-rpi-git-eventclients')
  replaces=('kodi-eventclients-rbp4-git')
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

package_kodi-rockpro64-git-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker Tool"
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')
  conflicts=('kodi-tools-texturepacker' 'kodi-tools-texturepacker-rbp4-git' 'kodi-rpi-tools-texturepacker' 'kodi-rpi-legacy-tools-texturepacker' 'kodi-rpi-git-tools-texturepacker')
  replaces=('kodi-tools-texturepacker-rbp4-git')

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

package_kodi-rockpro64-git-dev() {
  pkgdesc="Kodi dev files"
  depends=('kodi')
  conflicts=('kodi-dev-rbp4-git' 'kodi-rpi-dev' 'kodi-rpi-legacy-dev' 'kodi-rpi-git-dev')
  replaces=('kodi-dev-rbp4-git')
  provides=("kodi-dev=${pkgver}")

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
