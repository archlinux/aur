# Maintainer:
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>
# Contributor: Brendan Szymanski <hello@bscubed.dev>

# options
: ${_pkgtype:=git}

# basic info
_pkgname="yuzu"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=r26003.e9a43bae6
pkgrel=1
pkgdesc='An experimental open-source emulator for the Nintendo Switch'
url="https://github.com/yuzu-emu/yuzu"
license=('GPL2')
arch=('i686' 'x86_64')

# main package
_main_package() {
  depends=(
    'boost-libs'
    'fmt'
    'qt6-multimedia'
    'qt6-webengine'
    'sdl2'

    #'cubeb'
    #'enet'
    #'mbedtls'
  )
  makedepends=(
    'boost'
    'catch2'
    'cmake'
    'ffmpeg'
    'gcc'
    'git'
    'glslang'
    'mold'
    'ninja'
    'nlohmann-json'
    'qt6-tools'
    'rapidjson'
    'robin-map'
    'stb'

    #'clang'
    #'cpp-httplib'
    #'cpp-jwt'
    #'llvm'
    #'renderdoc'
    #'spirv-headers'
    #'vulkan-headers'
    #'vulkan-memory-allocator'
  )
  optdepends=(
    "qt6-wayland: Wayland support"
  )

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  _source_yuzu
  _source_bylaws_libadrenotools
  _source_lat9nq_tzdb_to_nx
  _source_mozilla_cubeb
  _source_yuzu_emu_sirit
}

# submodules
_source_yuzu() {
  source+=(
    'arun11299.cpp-jwt'::'git+https://github.com/arun11299/cpp-jwt.git'
    'brofield.simpleini'::'git+https://github.com/brofield/simpleini.git'
    'bylaws.libadrenotools'::'git+https://github.com/bylaws/libadrenotools.git'
    'ffmpeg'::'git+https://github.com/FFmpeg/FFmpeg.git'
    'gpuopen-librariesandsdks.vulkanmemoryallocator'::'git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
    'herumi.xbyak'::'git+https://github.com/herumi/xbyak.git'
    'khronosgroup.vulkan-headers'::'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
    'lat9nq.tzdb_to_nx'::'git+https://github.com/lat9nq/tzdb_to_nx.git'
    'libsdl-org.sdl'::'git+https://github.com/libsdl-org/SDL.git'
    'libusb'::'git+https://github.com/libusb/libusb.git'
    'lsalzman.enet'::'git+https://github.com/lsalzman/enet.git'
    'merryhime.dynarmic'::'git+https://github.com/merryhime/dynarmic.git'
    'merryhime.oaknut'::'git+https://github.com/merryhime/oaknut.git'
    'microsoft.vcpkg'::'git+https://github.com/microsoft/vcpkg.git'
    'mozilla.cubeb'::'git+https://github.com/mozilla/cubeb.git'
    'xiph.opus'::'git+https://github.com/xiph/opus.git'
    'yhirose.cpp-httplib'::'git+https://github.com/yhirose/cpp-httplib.git'
    'yuzu-emu.breakpad'::'git+https://github.com/yuzu-emu/breakpad.git'
    'yuzu-emu.discord-rpc'::'git+https://github.com/yuzu-emu/discord-rpc.git'
    'yuzu-emu.mbedtls'::'git+https://github.com/yuzu-emu/mbedtls.git'
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
  )

  _prepare_yuzu() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['arun11299.cpp-jwt']='externals/cpp-jwt'
      ['brofield.simpleini']='externals/simpleini'
      ['bylaws.libadrenotools']='externals/libadrenotools'
      ['ffmpeg']='externals/ffmpeg/ffmpeg'
      ['gpuopen-librariesandsdks.vulkanmemoryallocator']='externals/VulkanMemoryAllocator'
      ['herumi.xbyak']='externals/xbyak'
      ['khronosgroup.vulkan-headers']='externals/Vulkan-Headers'
      ['lat9nq.tzdb_to_nx']='externals/nx_tzdb/tzdb_to_nx'
      ['libsdl-org.sdl']='externals/SDL'
      ['libusb']='externals/libusb/libusb'
      ['lsalzman.enet']='externals/enet'
      ['merryhime.dynarmic']='externals/dynarmic'
      ['merryhime.oaknut']='externals/oaknut'
      ['microsoft.vcpkg']='externals/vcpkg'
      ['mozilla.cubeb']='externals/cubeb'
      ['xiph.opus']='externals/opus'
      ['yhirose.cpp-httplib']='externals/cpp-httplib'
      ['yuzu-emu.breakpad']='externals/breakpad'
      ['yuzu-emu.discord-rpc']='externals/discord-rpc'
      ['yuzu-emu.mbedtls']='externals/mbedtls'
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

_source_lat9nq_tzdb_to_nx() {
  source+=(
    'eggert.tz'::'git+https://github.com/eggert/tz.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_lat9nq_tzdb_to_nx() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "externals/nx_tzdb/tzdb_to_nx"
    local -A _submodules=(
      ['eggert.tz']='externals/tz/tz'
    )
    _submodule_update
  )
}

_source_mozilla_cubeb() {
  source+=(
    'arsenm.sanitizers-cmake'::'git+https://github.com/arsenm/sanitizers-cmake.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_mozilla_cubeb() (
    cd "${srcdir:?}/$_pkgsrc"
    cd "externals/cubeb"
    local -A _submodules=(
      ['arsenm.sanitizers-cmake']='cmake/sanitizers-cmake'
      ['google.googletest']='googletest'
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
pkgver() {
  cd "$_pkgsrc"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=9 HEAD)"
}

prepare() {
  _submodule_update() {
    local key
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_yuzu

  _prepare_bylaws_libadrenotools
  _prepare_lat9nq_tzdb_to_nx
  _prepare_mozilla_cubeb
  _prepare_yuzu_emu_sirit
}

build() {
  local _cmake_options=(
    -S "$_pkgsrc"
    -B build
    -GNinja
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_C_COMPILER="gcc"
    -DCMAKE_CXX_COMPILER="g++"
    -DCMAKE_C_FLAGS="$CFLAGS"
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
    -DCMAKE_BUILD_TYPE="Release"

    -DYUZU_DOWNLOAD_TIME_ZONE_DATA=ON
    -DYUZU_ENABLE_LTO=ON
    -DYUZU_TESTS=OFF
    -DYUZU_USE_BUNDLED_FFMPEG=OFF
    -DYUZU_USE_BUNDLED_QT=OFF
    -DYUZU_USE_FASTER_LD=OFF
    -DYUZU_USE_EXTERNAL_SDL2=OFF
    -DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF
    -DYUZU_USE_QT_MULTIMEDIA=ON
    -DYUZU_USE_QT_WEB_ENGINE=ON
    -DENABLE_QT6=ON
    -DENABLE_QT_TRANSLATION=ON
    -DUSE_DISCORD_PRESENCE=ON
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=OFF

    -DBUILD_REPOSITORY=yuzu-emu/yuzu
    -DTITLE_BAR_FORMAT_IDLE="yuzu | ${pkgver} {}"
    -DTITLE_BAR_FORMAT_RUNNING="yuzu | ${pkgver} | {}"
    -Wno-dev

    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execut
_main_package
