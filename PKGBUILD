# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Seppia <seppia@seppio.fish>
# Maintainer: JustKidding <jk@vin.ovh>

# Based on extra/chromium, with ungoogled-chromium patches

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ungoogled-chromium-xdg
pkgver=113.0.5672.92
pkgrel=1
_launcher_ver=8
_manual_clone=0
pkgdesc="A lightweight approach to removing Google web service dependency - without creating a useless ~/.pki directory"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'wayland' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'nodejs' 'pipewire'
             'qt5-base' 'java-runtime-headless' 'git' 'dos2unix')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
        add-cstring-for-std-strlen-in-web_view_impl.cc.patch
        download-bubble-typename.patch
        webauthn-variant.patch
        disable-GlobalMediaControlsCastStartStop.patch
        use-oauth2-client-switches-as-default.patch
        xdg-basedir.patch
        no-omnibox-suggestion-autocomplete.patch
        index.html)
sha256sums=('76cec11dc13abe6703305b0300e1fe24c8f547c1ff313f7be09db0e23d12ee1e'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            '5f868cba9e4d387499711738adc6fd87ab9f1ef61f464016bc682660ae59206a'
            'd464eed4be4e9bf6187b4c40a759c523b7befefa25ba34ad6401b2a07649ca2a'
            '590fabbb26270947cb477378b53a9dcd17855739076b4af9983e1e54dfcab6d7'
            '7f3b1b22d6a271431c1f9fc92b6eb49c6d80b8b3f868bdee07a6a1a16630a302'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711'
            'f97e6cd3c4d2e04f5d9a0ea234fe768d6ba0fa9f4ecd5c7b2ca91030a1249078'
            'ff1591fa38e0ede7e883dc7494b813641b7a1a7cb1ded00d9baaee987c1dbea8'
            'a4cdd2b86f32d5302c2792be841ff40d982b19bb58a4e63df9d77f4c706b8665')

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six')
fi

provides=("chromium=${pkgver}" "chromedriver=${pkgver}")
conflicts=('chromium' 'chromedriver')
_uc_usr=ungoogled-software
_uc_ver=$pkgver-1
source=(${source[@]}
        ${pkgname%-*}-$_uc_ver.tar.gz::https://github.com/$_uc_usr/ungoogled-chromium/archive/$_uc_ver.tar.gz
        ozone-add-va-api-support-to-wayland.patch
        vaapi-add-av1-support.patch
        remove-main-main10-profile-limit.patch
        chromium-112-gcc-13-0001-openscreen.patch
        chromium-112-gcc-13-0003-ruy.patch
        chromium-112-gcc-13-0004-swiftshader.patch
        chromium-112-gcc-13-0005-tensorflow-tflite.patch
        chromium-112-gcc-13-0006-vulkanmemoryallocator.patch
        chromium-112-gcc-13-0007-misc.patch
        chromium-112-gcc-13-0008-dawn.patch
        chromium-112-gcc-13-0009-base.patch
        chromium-112-gcc-13-0010-components.patch
        chromium-112-gcc-13-0011-s2cellid.patch
        chromium-112-gcc-13-0014-maldoca.patch
        chromium-112-gcc-13-0015-net.patch
        chromium-112-gcc-13-0016-cc-targetproperty.patch
        chromium-112-gcc-13-0017-gpu_feature_info.patch
        chromium-112-gcc-13-0018-encounteredsurfacetracker.patch
        chromium-112-gcc-13-0019-documentattachmentinfo.patch
        chromium-112-gcc-13-0020-pdfium.patch
        chromium-112-gcc-13-0021-gcc-copy-list-init-net-HostCache.patch
        chromium-112-gcc-13-0022-gcc-ambiguous-ViewTransitionElementId-type.patch
        chromium-112-gcc-13-0023-gcc-incomplete-type-v8-subtype.patch
        chromium-113-gcc-13-vulkan-build-fixes.patch)
sha256sums=(${sha256sums[@]}
            'ad7a3169d95f182df748940349e2c25868a201949486257829fdb42c69a83a51'
            'e9e8d3a82da818f0a67d4a09be4ecff5680b0534d7f0198befb3654e9fab5b69'
            'e742cc5227b6ad6c3e0c2026edd561c6d3151e7bf0afb618578ede181451b307'
            'be8d3475427553feb5bd46665ead3086301ed93c9a41cf6cc2644811c5bda51c'
            'd0e037f134842db091f7f88afa5e999531850d92a5399a1663783853fc14d3fe'
            '4c90e796fe2eaa5f07cfd01cf4527c0a42ed21c98777fe4bd7e7720f4c34efc9'
            'dc3135570e6f625178e5390aa77f7b9b79533fd13d50ea21cccb18b3cafb546b'
            'ef6b52377a7e7590d1fe7e4029eccafbd44c0531abe78b12c05e9c2a08be8eb9'
            '3c719fff7777af4c43e752a747be42894d074dd8fd58199a4b105721d380ee6d'
            'e9eb4684da654c03e2ff5cda1069b6f5b344de333d6800730cec8f4d15000a08'
            'dfae1b997efb6e6af1c9a8e986c82c16d19b6401c3d91a3dd67803f9ccb4fea2'
            'bf39f1e3adc9126db89fd4215a2d6632fda03ab93606b526776ff999350e2488'
            '351b8548712a8d5edc009165cfbe104bc65e214c7c79d22d97b6d8eb3d7d731f'
            'fb52f89b7017da19f3be7daa6743786456f67ad9455a9c423736051d3f7a0058'
            '7a68c0ea1e4e6edc823e330070c8182b50eaaab64d7630ffe1578658d188170a'
            '59c6623042f2be866da818516caf0c26098b018bb749050ae15b471e6abf047a'
            '7bf7676ec9fcbf288919a372b3623826d272ece536b3b5e4f6c6bf3643bfe67e'
            '7cf5f81d45c31e4b8f73840ac360a3cb412ca72a33435d842af5446fd742cf80'
            'e49f2b58b6ea45ea1eccd4699e772bef52c8f2171b5e8e3714490e20e7791c3e'
            '15b0ad5feed40930861e6b463ee20f4d84029eec4c803a0d346aa91200c17bca'
            '850b20191a9d894bdf99806f7838b8e231474561405b2cc2ee51d6fb0d099e43'
            '804888df05e86517a0d894e716c20f438bb109c344e4be29f4d01dec754115a7'
            '8381b911b69cef40a52285cf87949ab534f2485df8d3980be73c5aae5c693e32'
            '42ca609763db35363bf756bf3fa4f119e84fe58d3dfe0fc32151afe89aabf85a'
            'e7f84823c43f494eb481f0a83f5d13ab9ed8eb0f179dba1a4b715ba91d788390')

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
  #[libaom]=aom      # https://aomedia.googlesource.com/aom/+/706ee36dcc82
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
  #[zlib]=minizip    # broken include from chrome/common/safe_browsing/zip_analyzer.h
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
#
# Starting with Chromium 89 (2021-03-02) the OAuth2 credentials have been left
# out: https://archlinux.org/news/chromium-losing-sync-support-in-early-march/
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd "$srcdir/chromium-$pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i ../use-oauth2-client-switches-as-default.patch

  # Upstream fixes
  patch -Np1 -i ../add-cstring-for-std-strlen-in-web_view_impl.cc.patch

  # Disable kGlobalMediaControlsCastStartStop by default
  # https://crbug.com/1314342
  patch -Np1 -i ../disable-GlobalMediaControlsCastStartStop.patch

  # Build fixes
  patch -Np1 -i ../download-bubble-typename.patch
  patch -Np1 -i ../webauthn-variant.patch

  # gcc 13 patches
  patch -Np1 -i ../chromium-112-gcc-13-0001-openscreen.patch
  patch -Np1 -i ../chromium-112-gcc-13-0003-ruy.patch
  patch -Np1 -i ../chromium-112-gcc-13-0004-swiftshader.patch
  patch -Np1 -i ../chromium-112-gcc-13-0005-tensorflow-tflite.patch
  dos2unix third_party/vulkan_memory_allocator/include/vk_mem_alloc.h
  patch -Np1 -i ../chromium-112-gcc-13-0006-vulkanmemoryallocator.patch
  patch -Np1 -i ../chromium-112-gcc-13-0007-misc.patch
  patch -Np1 -i ../chromium-112-gcc-13-0008-dawn.patch
  patch -Np1 -i ../chromium-112-gcc-13-0009-base.patch
  patch -Np1 -i ../chromium-112-gcc-13-0010-components.patch
  patch -Np1 -i ../chromium-112-gcc-13-0011-s2cellid.patch
  patch -Np1 -i ../chromium-112-gcc-13-0014-maldoca.patch
  patch -Np1 -i ../chromium-112-gcc-13-0015-net.patch
  patch -Np1 -i ../chromium-112-gcc-13-0016-cc-targetproperty.patch
  patch -Np1 -i ../chromium-112-gcc-13-0017-gpu_feature_info.patch
  patch -Np1 -i ../chromium-112-gcc-13-0018-encounteredsurfacetracker.patch
  patch -Np1 -i ../chromium-112-gcc-13-0019-documentattachmentinfo.patch
  patch -Np1 -i ../chromium-112-gcc-13-0020-pdfium.patch
  patch -Np1 -i ../chromium-112-gcc-13-0021-gcc-copy-list-init-net-HostCache.patch
  patch -Np1 -i ../chromium-112-gcc-13-0022-gcc-ambiguous-ViewTransitionElementId-type.patch
  patch -Np1 -i ../chromium-112-gcc-13-0023-gcc-incomplete-type-v8-subtype.patch
  patch -Np1 -i ../chromium-113-gcc-13-vulkan-build-fixes.patch

  # move ~/.pki directory to ${XDG_DATA_HOME:-$HOME/.local}/share/pki
  patch -p1 -i ../xdg-basedir.patch

  # You can now set '1' in the flag #omnibox-ui-max-autocomplete-matches to
  # effectively disable autocompletion in the url bar (and therefore the so-
  # called 'shoulder surfing').
  patch -p1 -i ../no-omnibox-suggestion-autocomplete.patch

  # Custom Patches
  patch -Np1 -i ../ozone-add-va-api-support-to-wayland.patch
  patch -Np1 -i ../vaapi-add-av1-support.patch
  sed -i '/^bool IsHevcProfileSupported(const VideoType& type) {$/{s++bool IsHevcProfileSupported(const VideoType\& type) { return true;+;h};${x;/./{x;q0};x;q1}' \
    media/base/supported_types.cc

  # Ungoogled Chromium changes
  _ungoogled_repo="$srcdir/${pkgname%xdg*}$_uc_ver"
  _utils="${_ungoogled_repo}/utils"
  msg2 'Pruning binaries'
  python "$_utils/prune_binaries.py" ./ "$_ungoogled_repo/pruning.list"
  msg2 'Applying patches'
  python "$_utils/patches.py" apply ./ "$_ungoogled_repo/patches"
  msg2 'Applying domain substitution'
  python "$_utils/domain_substitution.py" apply -r "$_ungoogled_repo/domain_regex.list" \
    -f "$_ungoogled_repo/domain_substitution.list" -c domainsubcache.tar.gz ./

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -s /usr/bin/java third_party/jdk/current/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    "google_api_key=\"$_google_api_key\""
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # enable HEVC decoding
  _flags+=(
    'enable_platform_hevc=true'
    'enable_hevc_parser_and_hw_decoder=true'
  )

  # Append ungoogled chromium flags to _flags array
  _ungoogled_repo="$srcdir/${pkgname%xdg*}$_uc_ver"
  readarray -t -O ${#_flags[@]} _flags < "${_ungoogled_repo}/flags.gn"

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

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

  gn gen out/Release --args="${_flags[*]}"
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -D out/Release/chromedriver "$pkgdir/usr/bin/chromedriver"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e 's/@@MENUNAME@@/Chromium/g' \
    -e 's/@@PACKAGE@@/chromium/g' \
    -e 's/@@USR_BIN_SYMLINK_NAME@@/chromium/g' \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 chrome/installer/linux/common/chromium-browser/chromium-browser.appdata.xml \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"
  sed -ni \
    -e 's/chromium-browser\.desktop/chromium.desktop/' \
    -e '/<update_contact>/d' \
    -e '/<p>/N;/<p>\n.*\(We invite\|Chromium supports Vorbis\)/,/<\/p>/d' \
    -e '/^<?xml/,$p' \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    chrome_crashpad_handler
    libqt5_shim.so
    resources.pak
    v8_context_snapshot.bin

    # ANGLE
    libEGL.so
    libGLESv2.so

    # SwiftShader ICD
    libvk_swiftshader.so
    vk_swiftshader_icd.json
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
  install -Dm644 "${srcdir}/index.html" "$pkgdir/usr/share/ungoogled-chromium/index.html"
}

# vim:set ts=2 sw=2 et:
