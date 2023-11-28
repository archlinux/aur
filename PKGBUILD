# Maintainer:

# options
: ${_gcc_version:=12}

#: ${_tag:=qt-v2.0.1}
: ${_commit:=e4501c789d76ed335939d2fa7632b8089307665a}

: ${_pkgtype:=git}

# basic info
_pkgname=maplibre-native
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=2.0.1.r278.ge4501c789d
pkgrel=1
pkgdesc="C++ library that powers customizable vector maps in native applications"
url="https://github.com/maplibre/maplibre-native"
arch=("x86_64" "aarch64")
license=('BSD')

# main package
_main_package() {
  depends=(
    'qt5-base'
  )
  makedepends=(
    "gcc${_gcc_version:-}"

    'cmake'
    'git'
    'glfw'
    'libwebp'
  )

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="${_pkgname:?}"
  source+=("${_pkgsrc:?}"::"git+$url.git#commit=$_commit")
  sha256sums+=('SKIP')

  _source_maplibre_native

  # maplibre_native submodules
  _source_mapbox_earcut_hpp
  _source_mapbox_eternal
  _source_mapbox_polylabel
  _source_mapbox_vector_tile
  _source_mapbox_wagyu
  _source_maplibre_maplibre_native_base

  # maplibre_native_base submodules
  _source_mapbox_geojson_hpp
  _source_mapbox_geojson_vt_cpp
  _source_mapbox_supercluster_hpp
  _source_mapbox_variant
  _source_mourner_kdbush_hpp
  _source_tencent_rapidjson

  # vector_tile submodules
  #_source_mapbox_mvt_fixtures
}

# submodules
_source_maplibre_native() {
  source+=(
    'jothepro.doxygen-awesome-css'::'git+https://github.com/jothepro/doxygen-awesome-css.git'
    'maplibre.maplibre-java'::'git+https://github.com/maplibre/maplibre-java.git'
    'maplibre.maplibre-native-base'::'git+https://github.com/maplibre/maplibre-native-base.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
    'ziparchive'::'git+https://github.com/ZipArchive/ZipArchive.git'
    'mapbox.polylabel'::'git+https://github.com/mapbox/polylabel.git'
    #'microsoft.vcpkg'::'git+https://github.com/microsoft/vcpkg.git'
    'mapbox.eternal'::'git+https://github.com/mapbox/eternal.git'
    'mapbox.mapbox-gestures-android'::'git+https://github.com/mapbox/mapbox-gestures-android.git'
    'maplibre.maplibre-gl-native-boost'::'git+https://github.com/maplibre/maplibre-gl-native-boost.git'
    'okdshin.unique_resource'::'git+https://github.com/okdshin/unique_resource.git'
    'mapbox.earcut.hpp'::'git+https://github.com/mapbox/earcut.hpp.git'
    'mapbox.vector-tile'::'git+https://github.com/mapbox/vector-tile.git'
    'yhirose.cpp-httplib'::'git+https://github.com/yhirose/cpp-httplib.git'
    'mapbox.protozero'::'git+https://github.com/mapbox/protozero.git'
    'mapbox.wagyu'::'git+https://github.com/mapbox/wagyu.git'
    'google.benchmark'::'git+https://github.com/google/benchmark.git'
    #'martinus.unordered_dense'::'git+https://github.com/martinus/unordered_dense.git'
  )
  sha256sums+=(
    #'SKIP'
    #'SKIP'
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

  _prepare_maplibre_native() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['jothepro.doxygen-awesome-css']='docs/doxygen/doxygen-awesome-css'
      ['maplibre.maplibre-java']='platform/android/vendor/maplibre-java'
      ['maplibre.maplibre-native-base']='vendor/mapbox-base'
      ['google.googletest']='vendor/googletest'
      ['ziparchive']='vendor/zip-archive'
      ['mapbox.polylabel']='vendor/polylabel'
      #['microsoft.vcpkg']='platform/windows/vendor/vcpkg'
      ['mapbox.eternal']='vendor/eternal'
      ['mapbox.mapbox-gestures-android']='platform/android/vendor/mapbox-gestures-android'
      ['maplibre.maplibre-gl-native-boost']='vendor/boost'
      ['okdshin.unique_resource']='vendor/unique_resource'
      ['mapbox.earcut.hpp']='vendor/earcut.hpp'
      ['mapbox.vector-tile']='vendor/vector-tile'
      ['yhirose.cpp-httplib']='vendor/cpp-httplib'
      ['mapbox.protozero']='vendor/protozero'
      ['mapbox.wagyu']='vendor/wagyu'
      ['google.benchmark']='vendor/benchmark'
      #['martinus.unordered_dense']='vendor/unordered_dense'
    )
    _submodule_update
  )
}

_source_mapbox_earcut_hpp() {
  source+=(
    'glfw'::'git+https://github.com/glfw/glfw.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_earcut_hpp() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/earcut.hpp'
    local -A _submodules=(
      ['glfw']='glfw'
    )
    _submodule_update
  )
}

_source_mapbox_eternal() {
  source+=(
    'google.benchmark'::'git+https://github.com/google/benchmark.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_eternal() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/eternal'
    local -A _submodules=(
      ['google.benchmark']='vendor/benchmark'
    )
    _submodule_update
  )
}

_source_mapbox_polylabel() {
  source+=(
    'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_polylabel() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/polylabel'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_mapbox_vector_tile() {
  source+=(
    'mapbox.mvt-fixtures'::'git+https://github.com/mapbox/mvt-fixtures.git'
    'mapbox.mvt-bench-fixtures'::'git+https://github.com/mapbox/mvt-bench-fixtures.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_mapbox_vector_tile() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/vector-tile'
    local -A _submodules=(
      ['mapbox.mvt-fixtures']='test/mvt-fixtures'
      ['mapbox.mvt-bench-fixtures']='bench/mvt-bench-fixtures'
    )
    _submodule_update
  )
}

_source_mapbox_wagyu() {
  source+=(
    'mapnik.geometry-test-data'::'git+https://github.com/mapnik/geometry-test-data.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_wagyu() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/wagyu'
    local -A _submodules=(
      ['mapnik.geometry-test-data']='tests/geometry-test-data'
    )
    _submodule_update
  )
}

_source_maplibre_maplibre_native_base() {
  source+=(
    'mapbox.jni.hpp'::'git+https://github.com/mapbox/jni.hpp.git'
    'mapbox.shelf-pack-cpp'::'git+https://github.com/mapbox/shelf-pack-cpp.git'
    'taywee.args'::'git+https://github.com/Taywee/args.git'
    'google.googletest'::'git+https://github.com/google/googletest.git'
    'mapbox.geometry.hpp'::'git+https://github.com/mapbox/geometry.hpp.git'
    'mourner.kdbush.hpp'::'git+https://github.com/mourner/kdbush.hpp.git'
    'gulrak.filesystem'::'git+https://github.com/gulrak/filesystem.git'
    'mapbox.optional'::'git+https://github.com/mapbox/Optional.git'
    'tencent.rapidjson'::'git+https://github.com/Tencent/rapidjson.git'
    'mapbox.geojson.hpp'::'git+https://github.com/mapbox/geojson.hpp.git'
    'mapbox.cheap-ruler-cpp'::'git+https://github.com/mapbox/cheap-ruler-cpp.git'
    'mapbox.geojson-vt-cpp'::'git+https://github.com/mapbox/geojson-vt-cpp.git'
    'mapbox.supercluster.hpp'::'git+https://github.com/mapbox/supercluster.hpp.git'
    'martinmoene.expected-lite'::'git+https://github.com/martinmoene/expected-lite.git'
    'mapbox.variant'::'git+https://github.com/mapbox/variant.git'
    'mapbox.pixelmatch-cpp'::'git+https://github.com/mapbox/pixelmatch-cpp.git'
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
  )

  _prepare_maplibre_maplibre_native_base() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    local -A _submodules=(
      ['mapbox.jni.hpp']='deps/jni.hpp'
      ['mapbox.shelf-pack-cpp']='deps/shelf-pack-cpp'
      ['taywee.args']='extras/args'
      ['google.googletest']='extras/googletest'
      ['mapbox.geometry.hpp']='deps/geometry.hpp'
      ['mourner.kdbush.hpp']='extras/kdbush.hpp'
      ['gulrak.filesystem']='extras/filesystem'
      ['mapbox.optional']='deps/optional'
      ['tencent.rapidjson']='extras/rapidjson'
      ['mapbox.geojson.hpp']='deps/geojson.hpp'
      ['mapbox.cheap-ruler-cpp']='deps/cheap-ruler-cpp'
      ['mapbox.geojson-vt-cpp']='deps/geojson-vt-cpp'
      ['mapbox.supercluster.hpp']='deps/supercluster.hpp'
      ['martinmoene.expected-lite']='extras/expected-lite'
      ['mapbox.variant']='deps/variant'
      ['mapbox.pixelmatch-cpp']='deps/pixelmatch-cpp'
    )
    _submodule_update
  )
}

_source_mapbox_geojson_vt_cpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_geojson_vt_cpp() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'deps/geojson-vt-cpp'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_mapbox_geojson_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_geojson_hpp() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'deps/geojson.hpp'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_mapbox_supercluster_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_supercluster_hpp() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'deps/supercluster.hpp'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_mapbox_variant() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mapbox_variant() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'deps/variant'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_mourner_kdbush_hpp() {
  source+=(
    #'mapbox.mason'::'git+https://github.com/mapbox/mason.git'
  )
  sha256sums+=(
    #'SKIP'
  )

  _prepare_mourner_kdbush_hpp() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'extras/kdbush.hpp'
    local -A _submodules=(
      ['mapbox.mason']='.mason'
    )
    _submodule_update
  )
}

_source_tencent_rapidjson() {
  source+=(
    'google.googletest'::'git+https://github.com/google/googletest.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_tencent_rapidjson() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/mapbox-base'
    cd 'extras/rapidjson'
    local -A _submodules=(
      ['google.googletest']='thirdparty/gtest'
    )
    _submodule_update
  )
}

_source_mapbox_mvt_fixtures() {
  source+=(
    'mapbox.vector-tile-spec'::'git+https://github.com/mapbox/vector-tile-spec.git'
  )
  sha256sums+=(
    'SKIP'
  )

  _prepare_mapbox_mvt_fixtures() (
    cd "${srcdir:?}/$_pkgsrc"
    cd 'vendor/vector-tile'
    cd 'test/mvt-fixtures'
    local -A _submodules=(
      ['mapbox.vector-tile-spec']='vector-tile-spec'
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

  _prepare_maplibre_native

  # maplibre_native submodules
  _prepare_mapbox_earcut_hpp
  _prepare_mapbox_eternal
  _prepare_mapbox_polylabel
  _prepare_mapbox_vector_tile
  _prepare_mapbox_wagyu
  _prepare_maplibre_maplibre_native_base

  # maplibre_native_base submodules
  _prepare_mapbox_geojson_hpp
  _prepare_mapbox_geojson_vt_cpp
  _prepare_mapbox_supercluster_hpp
  _prepare_mapbox_variant
  _prepare_mourner_kdbush_hpp
  _prepare_tencent_rapidjson

  # vector_tile submodules
  #_prepare_mapbox_mvt_fixtures
}

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --match='qt-*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  export CC="gcc${_gcc_version:+-$_gcc_version}"
  export CXX="g++${_gcc_version:+-$_gcc_version}"
  export LDFLAGS+="-Wl,--copy-dt-needed-entries"

  local _cmake_options=(
    -B build
    -S "${_pkgsrc:?}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'

    -DMBGL_WITH_QT=ON
    -DMBGL_WITH_WERROR=OFF

    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build

  install -Dm644 "${_pkgsrc:?}/LICENSE.mbgl-core.md" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE.mbgl-core"
  install -Dm644 "${_pkgsrc:?}/LICENSE.md" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"
}

# execute
_main_package
