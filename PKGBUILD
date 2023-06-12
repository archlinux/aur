# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pascal Ernster <archlinux@hardfalcon.net>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

# https://releases.electronjs.org/
# https://github.com/stha09/chromium-patches/releases

_use_suffix=1
pkgver=24.5.0
_chromiumver=112.0.5615.204
# shellcheck disable=SC2034
pkgrel=1

_major_ver=${pkgver%%.*}
if [[ ${_use_suffix} != 0 ]]; then
  pkgname="electron${_major_ver}"
else
  pkgbase="electron${_major_ver}"
  pkgname=electron
fi
# shellcheck disable=SC2034
pkgdesc='Build cross platform desktop apps with web technologies'
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
url='https://electronjs.org/'
# shellcheck disable=SC2034
license=('MIT' 'custom')
# shellcheck disable=SC2034
depends=('c-ares' 'gtk3' 'libevent' 'nss' 'libffi')
# shellcheck disable=SC2034
makedepends=('clang' 'git' 'gn' 'gperf' 'harfbuzz-icu' 'http-parser'
             'qt5-base' 'java-runtime-headless' 'libnotify' 'lld' 'llvm'
             'ninja' 'npm' 'pciutils' 'pipewire' 'python' 'python-httplib2'
             'python-pyparsing' 'python-six' 'wget' 'yarn')
# shellcheck disable=SC2034
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
if [[ ${_use_suffix} == 0 ]]; then
  # shellcheck disable=SC2034
  conflicts=("electron${_major_ver}")
  # shellcheck disable=SC2034
  provides=("electron${_major_ver}")
fi
# shellcheck disable=SC2034
options=('!lto') # Electron adds its own flags for ThinLTO
# shellcheck disable=SC2034
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#branch=main'
        "chromium-mirror::git+https://github.com/chromium/chromium.git#tag=$_chromiumver"
        "electron-launcher.sh"
        "electron.desktop"
        'default_app-icon.patch'
        'jinja-python-3.10.patch'
        'use-system-libraries-in-node.patch'
        'std-vector-non-const.patch'
        'sql-relax-constraints-on-VirtualCursor-layout.patch'
        'swiftshader-add-cstdint-for-uint64_t.patch'
        'dawn-iwyu-add-cstdint-for-uint8_t.patch'
        'iwyu-add-stdint.h-for-various-int-types-in-base.patch'
        'iwyu-add-cstdint-for-uintptr_t-in-device.patch'
        'iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch'
        'iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch'
        'iwyu-add-stdint.h-for-integer-types-in-ui.patch'
        'openscreen-iwyu-add-stdint.h.patch'
        'pdfium-iwyu-add-stdint.h-for-uint32_t.patch'
        'iwyu-add-stdint.h-for-uint32_t-in-cc.patch'
        'add-missing-includes-causing-build-errors.patch'
        'iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch'
        'iwyu-add-stdint.h-for-various-int-types-in-comp.patch'
        'iwyu-add-stdint.h-for-various-integer-types-in-net.patch'
        'iwyu-add-cstdint-for-int-types-in-s2cellid.patch'
        'random-fixes-for-gcc13.patch'
        'more-fixes-for-gcc13.patch'
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '77817939c9833f8dda74a8c75620c15747170551ffa6f14f7c5b4071599e8831'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            'e66be069d932fe18811e789c57b96249b7250257ff91a3d82d15e2a7283891b7'
            '208f2ebcef5c690207e6e798ffbf9e92214e9d35f415c2f6b93efebad831b7e2'
            '94baaaa6fbec0af6ec2e967f0b7440b4261a927e853e212d84f0aeaf56ae53f0'
            '0003e737072f4f1b22ff932221595e85dd9bf65720ccac36f840cccb8000e3e1'
            'ffe499d63c9c1074cbc3995c188c89b748388dbb9dccf975ce28a434c723acf7'
            '7af466e4b5985cc9f0b33df2f3cd2e458c7cbfd7190505d105aad4401c9d072b'
            '727588a1b42f6cfe54acf4759a0c3ad3778590d5a5cefcdcb54b579ba16b09c8'
            '0914be53b2205b34e4da96f5a94505ac2a01e3639ff433535a23be2d0d581fa7'
            '8c9662bed23bfd66ae76d044541f316624386ca4b3baef57a47289feb3db58a9'
            '890b6836cea4c31513166db720b210da20d20bcd97a713545268cceffd707af5'
            'f6a0e149ef5195883c56a875ae366ed92d9960652f2657bfb65b5408badafc65'
            '3255477d02d49ef86d47c727b9369f46dc787319bb648bf267a68f37e2041e50'
            '94995b4e37671dcd27968bd5a2ebcf50e67bd22659a4bb4a5d0a4f81ff54f471'
            '6b3c296de83c333678bc3d7cac939f33bbadae94c96299566ff2e31121c46256'
            '5dfbfd073f78c887bbffca2b644116571cc9b1196867e44e8fc0cbb40afcf1bc'
            'd97dc00f66fa5868584e4b6d5ef817911eab2dc8022a37c75a00d063f4dac483'
            '3fb0636e9560760d99e7c9606b1c9b59eef9d91ed3419cc95b43302759f249be'
            '9d1f69f668e12fc14b4ccbcf88cb5a3acf666df06dafa8834f037bd8110ca17f')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]=dav1d
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [jsoncpp]=jsoncpp
  [libaom]=aom
  #[libavif]=libavif # https://github.com/AOMediaCodec/libavif/commit/4d2776a3
  [libdrm]=
  [libjpeg]=libjpeg
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [woff2]=woff2
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  if [[ ${_use_suffix} != 0 ]]; then
    sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop
  else
    sed -i "s|@ELECTRON_NAME@|Electron|" electron.desktop
  fi

cat >.gclient <<EOF
solutions = [
  {
    "name": "src/electron",
    "url": "file://${srcdir}/electron@v$pkgver",
    "deps_file": "DEPS",
    "managed": False,
    "custom_deps": {
      "src": None,
    },
    "custom_vars": {},
  },
]
EOF

  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Linking chromium from sources..."
  ln -s chromium-mirror src

  depot_tools/gclient.py sync -D \
      --nohooks \
      --with_branch_heads \
      --with_tags

  (
    cd src/electron || exit
    patch -Np1 -i ../../std-vector-non-const.patch
  )

  echo "Running hooks..."
  # python "${srcdir}/depot_tools/gclient.py" runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron || exit
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local patches..."

  # chromium upstream fixes
  patch -Np1 -i "${srcdir}/sql-relax-constraints-on-VirtualCursor-layout.patch"

  # GCC13 patches for chromium (https://github.com/archlinux/svntogit-packages/commit/470e5cbc7b58b4955664cdae386161d22c17d980)
  patch -Np1 -i "${srcdir}/swiftshader-add-cstdint-for-uint64_t.patch" -d "third_party/swiftshader"
  patch -Np1 -i "${srcdir}/dawn-iwyu-add-cstdint-for-uint8_t.patch" -d "third_party/dawn"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-base.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-uintptr_t-in-device.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-integer-types-in-ui.patch"
  patch -Np1 -i "${srcdir}/openscreen-iwyu-add-stdint.h.patch" -d "third_party/openscreen/src"
  patch -Np1 -i "${srcdir}/pdfium-iwyu-add-stdint.h-for-uint32_t.patch" -d "third_party/pdfium"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-cc.patch"
  patch -Np1 -i "${srcdir}/add-missing-includes-causing-build-errors.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-comp.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-integer-types-in-net.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-int-types-in-s2cellid.patch"
  patch -Np1 -i "${srcdir}/random-fixes-for-gcc13.patch"
  patch -Np1 -i "${srcdir}/more-fixes-for-gcc13.patch"

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    third_party_dir="third_party/$_lib"
    if [ ! -d "${third_party_dir}" ]; then
      third_party_dir="base/${third_party_dir}"
    fi
    find "${third_party_dir}" -type f \
        \! -path "${third_party_dir}/chromium/*" \
        \! -path "${third_party_dir}/google/*" \
        \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
        \! -regex '.*\.\(gn\|gni\|isolate\)' \
        -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  cd src || exit
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  GN_EXTRA_ARGS='
    custom_toolchain = "//build/toolchain/linux/unbundle:default"
    host_toolchain = "//build/toolchain/linux/unbundle:default"
    clang_base_path = "/usr"
    clang_use_chrome_plugins = false
    symbol_level = 0 # sufficient for backtraces on x86(_64)
    chrome_pgo_phase = 0
    treat_warnings_as_errors = false
    disable_fieldtrial_testing_config = true
    blink_enable_generated_code_formatting = false
    ffmpeg_branding = "Chrome"
    rtc_use_pipewire = true
    link_pulseaudio = true
    use_custom_libcxx = false
    use_gnome_keyring = false
    use_sysroot = false
    use_system_libffi = true
    icu_use_data_file = false
    is_component_ffmpeg = false
  '
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${GN_EXTRA_ARGS}"
  ninja -C out/Release electron
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"
  if [[ "${_use_suffix}" == 0 ]]; then
    ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}${_major_ver}"
    ln -s "/usr/lib/${pkgname}" "${pkgdir}/usr/lib/${pkgname}${_major_ver}"
  fi

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
