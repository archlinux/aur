# Maintainer:

## useful links:
# https://github.com/citra-emu/citra
# https://github.com/citra-emu/citra-nightly
# https://github.com/citra-emu/citra-canary

# options
: ${_build_clang:=true}

: ${_build_channel:=-nightly}

: ${_build_avx:=false}
: ${_build_git:=true}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="citra${_build_channel:-}"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2062.r0.g602f4f60
pkgrel=1
pkgdesc="Nintendo 3DS emulator"
_url="https://github.com/citra-emu/citra"
url="$_url${_build_channel:-}"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

# main package
_main_package() {
  depends=(
    'ffmpeg'
    'fmt'
    'libbacktrace-git'
    'libfdk-aac'
    'libinih'
    'libusb'
    'mbedtls'
    'openssl'
    'sndio'
    'soundtouch'
    'speexdsp'
    'zstd'

    # sdl
    'libinih'
    'sdl2'

    # qt
    'hicolor-icon-theme'
    'qt6-base'
    'qt6-multimedia'
    'sdl2'
  )
  makedepends=(
    'cmake'
    'doxygen'
    'git'
    'glslang'
    'nlohmann-json'
    'python'
    'qt6-multimedia'
    'qt6-tools'
    'rapidjson'
    'vulkan-headers'
  )
  optdepends=(
    'chaotic-interfere: chaotic-aur interference tracker'
    'libxkbcommon-x11: for X11 support'
    'qt6-wayland: for Wayland support'
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    makedepends+=(
      'clang'
      'lld'
      'llvm'
    )
  fi

  provides=(
    "citra"
    "citra-qt"
  )
  conflicts=(
    "citra"
    "citra-qt"

    "citra-git"
    "citra-qt-git"
  )

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  _source_citra
  _source_bylaws_libadrenotools
  _source_mozilla_cubeb
  _source_yuzu_emu_sirit
}

# submodules
_source_citra() {
  source+=(
    'abdes.cryptopp-cmake'::'git+https://github.com/abdes/cryptopp-cmake.git'
    'arun11299.cpp-jwt'::'git+https://github.com/arun11299/cpp-jwt.git'
    'benhoyt.inih'::'git+https://github.com/benhoyt/inih.git'
    'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    'catchorg.catch2'::'git+https://github.com/catchorg/Catch2.git'
    'citra-emu.ext-boost'::'git+https://github.com/citra-emu/ext-boost.git'
    'citra-emu.ext-library-headers'::'git+https://github.com/citra-emu/ext-library-headers.git'
    'citra-emu.ext-libressl-portable'::'git+https://github.com/citra-emu/ext-libressl-portable.git'
    'facebook.zstd'::'git+https://github.com/facebook/zstd.git'
    'fmtlib.fmt'::'git+https://github.com/fmtlib/fmt.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'herumi.xbyak'::'git+https://github.com/herumi/xbyak.git'
    'kcat.openal-soft'::'git+https://github.com/kcat/openal-soft.git'
    'khronosgroup.glslang'::'git+https://github.com/KhronosGroup/glslang.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    'knik0.faad2'::'git+https://github.com/knik0/faad2.git'
    'lemenkov.libyuv'::'git+https://github.com/lemenkov/libyuv.git'
    'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    'libusb'::'git+https://github.com/libusb/libusb.git'
    'lsalzman.enet'::'git+https://github.com/lsalzman/enet.git'
    'lvandeve.lodepng'::'git+https://github.com/lvandeve/lodepng.git'
    'merryhime.dynarmic'::'git+https://github.com/merryhime/dynarmic.git'
    'merryhime.oaknut'::'git+https://github.com/merryhime/oaknut.git'
    'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    'neobrain.nihstro'::'git+https://github.com/neobrain/nihstro.git'
    'septag.dds-ktx'::'git+https://github.com/septag/dds-ktx.git'
    'soundtouch'::'git+https://codeberg.org/soundtouch/soundtouch.git'
    'weidai11.cryptopp'::'git+https://github.com/weidai11/cryptopp.git'
    'wwylele.teakra'::'git+https://github.com/wwylele/teakra.git'
    'yuzu-emu.discord-rpc'::'git+https://github.com/yuzu-emu/discord-rpc.git'
    'yuzu-emu.sirit'::'git+https://github.com/yuzu-emu/sirit.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_citra() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['abdes.cryptopp-cmake']='externals/cryptopp-cmake'
      ['arun11299.cpp-jwt']='externals/cpp-jwt'
      ['benhoyt.inih']='externals/inih/inih'
      ['bylaws.libadrenotools']='externals/libadrenotools'
      ['catchorg.catch2']='externals/catch2'
      ['citra-emu.ext-boost']='externals/boost'
      ['citra-emu.ext-library-headers']='externals/library-headers'
      ['citra-emu.ext-libressl-portable']='externals/libressl'
      ['facebook.zstd']='externals/zstd'
      ['fmtlib.fmt']='externals/fmt'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='externals/vma'
      ['herumi.xbyak']='externals/xbyak'
      ['kcat.openal-soft']='externals/openal-soft'
      ['khronosgroup.glslang']='externals/glslang'
      ['khronosgroup.vulkan-headers']='externals/vulkan-headers'
      ['knik0.faad2']='externals/faad2/faad2'
      ['lemenkov.libyuv']='externals/libyuv'
      ['libsdl-org.sdl']='externals/sdl2/SDL'
      ['libusb']='externals/libusb/libusb'
      ['lsalzman.enet']='externals/enet'
      ['lvandeve.lodepng']='externals/lodepng/lodepng'
      ['merryhime.dynarmic']='externals/dynarmic'
      ['merryhime.oaknut']='externals/oaknut'
      ['mozilla.cubeb']='externals/cubeb'
      ['neobrain.nihstro']='externals/nihstro'
      ['septag.dds-ktx']='externals/dds-ktx'
      ['soundtouch']='externals/soundtouch'
      ['weidai11.cryptopp']='externals/cryptopp'
      ['wwylele.teakra']='externals/teakra'
      ['yuzu-emu.discord-rpc']='externals/discord-rpc'
      ['yuzu-emu.sirit']='externals/sirit'
    )
    _submodule_update
  )
}

_source_bylaws_libadrenotools() {
  source+=(
    'bylaws.liblinkernsbypass'::'git+https://github.com/bylaws/liblinkernsbypass.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_bylaws_libadrenotools() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "externals/libadrenotools"
    local -A _submodules=(
      ['bylaws.liblinkernsbypass']='lib/linkernsbypass'
    )
    _submodule_update
  )
}

_source_mozilla_cubeb() {
  source+=(
    'google.googletest'::'git+https://github.com/google/googletest.git'
    'arsenm.sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_mozilla_cubeb() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "externals/cubeb"
    local -A _submodules=(
      ['google.googletest']='googletest'
      ['arsenm.sanitizers-cmake']='cmake/sanitizers-cmake'
    )
    _submodule_update
  )
}

_source_yuzu_emu_sirit() {
  source+=(
    'khronosgroup.spirv-headers'::'git+https://github.com/KhronosGroup/SPIRV-Headers.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_yuzu_emu_sirit() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "externals/sirit"
    local -A _submodules=(
      ['khronosgroup.spirv-headers']='externals/SPIRV-Headers'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_citra
  _prepare_mozilla_cubeb
  _prepare_bylaws_libadrenotools
  _prepare_yuzu_emu_sirit
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=8 --exclude='untagged*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Fix to help cmake find libusb
  CXXFLAGS+=" -I/usr/include/libusb-1.0"

  local _cmake_options=(
    -S "$_pkgsrc"
    -B build

    -DCMAKE_BUILD_TYPE="Release"
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DENABLE_LTO=ON

    -DENABLE_QT_TRANSLATION=ON

    -DCITRA_ENABLE_COMPATIBILITY_REPORTING=ON
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON

    -DBUILD_TAG="${pkgver}"
    -DTITLE_BAR_FORMAT_IDLE="citra | ${pkgver} | {}"
    -DTITLE_BAR_FORMAT_RUNNING="citra | ${pkgver} | {}"

    -DUSE_DISCORD_PRESENCE=ON
    -DUSE_SYSTEM_BOOST=OFF
    -DUSE_SYSTEM_FFMPEG_HEADERS=ON
    -DUSE_SYSTEM_FMT=ON
    #-DUSE_SYSTEM_GLSLANG=ON
    -DUSE_SYSTEM_INIH=ON
    -DUSE_SYSTEM_JSON=ON
    -DUSE_SYSTEM_LIBUSB=ON
    -DUSE_SYSTEM_SDL2=ON
    -DUSE_SYSTEM_SOUNDTOUCH=ON
    -DUSE_SYSTEM_ZSTD=ON
    -Wno-dev
  )

  if [[ "${_build_clang::1}" == "t" ]] ; then
    export AR=llvm-ar
    export NM=llvm-nm

    _cmake_options+=(
      -DCMAKE_C_COMPILER=clang
      -DCMAKE_CXX_COMPILER=clang++

      -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld"
      -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld"
      -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld"
    )
  fi

  if [[ "${_build_avx::1}" == "t" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=skylake -O3"
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execute
_main_package
