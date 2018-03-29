# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>
# Contributor: Saikrishna Arcot <saiarcot895@gmail.com> and Steven Newbury <steve@snewbury.org.uk> (First Authors of VAAPI patch)

#########################
## -- Build options -- ##
#########################

_use_bundled_clang=1     # Use bundled clang compiler (downloaded binaries from google).
_use_wayland=0           # Build Wayland NOTE: extremely experimental and don't work at this moment

##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=67.0.3381.0
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Dev Channel)"
arch=('x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=(
#          'libsrtp'
         'libxslt'
         'libxss'
         'minizip'
         'nss'
         'pciutils'
         're2'
         'snappy'
         'xdg-utils'
         'libcups'
         'libxml2'
#          'harfbuzz-icu'
#          'protobuf'
#          'libevent'
#          'ffmpeg'
#          'icu'    # https://crbug.com/678661
         'gtk3'
         'openh264'
         'vulkan-icd-loader'
         'libpulse'
         'libwebp'
         'opus'
         )
makedepends=(
             'libexif'
             'gperf'
             'ninja'
             'python2-beautifulsoup4'
             'python2-html5lib'
             'python2-simplejson'
             'python2-six'
             'subversion'
             'yasm'
             'git'
             'hwids'
             'nodejs'
             'wget'
             'atk'
             'at-spi2-atk'
             'ncurses5-compat-libs'
             )
optdepends=(
            'pepper-flash: PPAPI Flash Player'
            'chromium-widevine-dev: Widevine plugin (eg: Netflix) (Dev Channel)'
            #
            'kdialog: Needed for file dialogs in KF5'
            'kwalletmanager: Needed for storing passwords in KWallet5'
            #
            'ttf-font: For some typography'
            #
            'libappindicator-gtk3: Needed for show systray icon in the panel on GTK3 Desktop based'
            #
            'libva-vdpau-driver-chromium: HW video acceleration for NVIDIA users'
            'libva-mesa-driver: HW video acceleration for Nouveau, R600 and RadeonSI users'
            'libva-intel-driver: HW video acceleration for Intel G45 and HD users'
            )
source=( #"https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
        "git+https://github.com/foutrelis/chromium-launcher.git"
        'chromium-dev.svg'
        # Patch form Gentoo
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-FORTIFY_SOURCE-r2.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-webrtc-r0.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-clang-r2.patch'
        'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-ffmpeg-r1.patch'
         # Misc Patches
        'chromium-intel-vaapi_r17.diff.base64::https://chromium-review.googlesource.com/changes/532294/revisions/17/patch?download'
        # Patch from crbug (chromium bugtracker) or Arch chromium package
        'chromium-widevine-r1.patch'
        'fix_gn.diff.base64::https://chromium-review.googlesource.com/changes/982250/revisions/2/patch?download'
        'chromium-skia-harmony.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/chromium-skia-harmony.patch?h=packages/chromium'
        )
sha256sums=( #"$(curl -sL https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            "$(curl -sL https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
            'SKIP'
            'dd2b5c4191e468972b5ea8ddb4fa2e2fa3c2c94c79fc06645d0efc0e63ce7ee1'
            # Patch form Gentoo
            'fa3f703d599051135c5be24b81dfcb23190bb282db73121337ac76bc9638e8a5'
            'bcb2f4588cf5dcf75cde855c7431e94fdcc34bdd68b876a90f65ab9938594562'
            '4495e8b29dae242c79ffe4beefc5171eb3c7aacb7e9aebfd2d4d69b9d8c958d3'
            'aa885330bc4180b78d915f9dfdfc3210038a0acab7b16735ea9828ab6a633bde'
            # Misc Patches
            '0db6db88f49e01a42b0defc9b152b90d628ff6a0c09268fe7b0c02c569acf60e'
            # Patch from crbug (chromium bugtracker) or Arch chromium package
            '0d537830944814fe0854f834b5dc41dc5fc2428f77b2ad61d4a5e76b0fe99880'
#             'd4a99239701256edb37ef3a5504fa87ca2219349834cbf59b9fe42bf7ac496d8'
            '1965356bb6e7ca5fb4be30b3034325b4eb8d91bcbc07d7c8c0c6e2591f05fbe9'
            'feca54ab09ac0fc9d0626770a6b899a6ac5a12173c7d0c1005bc3964ec83e7b3'
            )
install=chromium-dev.install

################################################
## -- Don't touch anything below this line -- ##
################################################

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# NOTE: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
_google_default_client_id="413772536636.apps.googleusercontent.com"
_google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

# List of third-party components needed for build chromium. The rest is remove by remove_bundled_libraries srcipt in prepare().
_keeplibs=(
           'base/third_party/dmg_fp'
           'base/third_party/dynamic_annotations'
           'base/third_party/icu'
           'base/third_party/nspr'
           'base/third_party/superfasthash'
           'base/third_party/symbolize'
           'base/third_party/valgrind'
           'base/third_party/xdg_mime'
           'base/third_party/xdg_user_dirs'
           'buildtools/third_party/libc++'
           'buildtools/third_party/libc++abi'
           'chrome/third_party/mozilla_security_manager'
           'courgette/third_party'
           'native_client/src/third_party/dlmalloc'
           'native_client_sdk/src/libraries/third_party/newlib-extras'
           'net/third_party/mozilla_security_manager'
           'net/third_party/nss'
           'third_party/WebKit'
           'third_party/analytics'
           'third_party/angle'
           'third_party/angle/src/common/third_party/base'
           'third_party/angle/src/common/third_party/smhasher'
           'third_party/angle/src/third_party/compiler'
           'third_party/angle/src/third_party/libXNVCtrl'
           'third_party/angle/src/third_party/trace_event'
           'third_party/angle/third_party/glslang'
           'third_party/angle/third_party/spirv-headers'
           'third_party/angle/third_party/spirv-tools'
           'third_party/angle/third_party/vulkan-validation-layers'
           'third_party/blink'
           'third_party/boringssl'
           'third_party/boringssl/src/third_party/fiat'
           'third_party/breakpad'
           'third_party/breakpad/breakpad/src/third_party/curl'
           'third_party/brotli'
           'third_party/cacheinvalidation'
           'third_party/catapult'
           'third_party/catapult/common/py_vulcanize/third_party/rcssmin'
           'third_party/catapult/common/py_vulcanize/third_party/rjsmin'
           'third_party/catapult/third_party/polymer'
           'third_party/catapult/tracing/third_party/d3'
           'third_party/catapult/tracing/third_party/gl-matrix'
           'third_party/catapult/tracing/third_party/jszip'
           'third_party/catapult/tracing/third_party/mannwhitneyu'
           'third_party/catapult/tracing/third_party/oboe'
           'third_party/catapult/tracing/third_party/pako'
           'third_party/ced'
           'third_party/cld_3'
           'third_party/crc32c'
           'third_party/cros_system_api'
           'third_party/devscripts'
           'third_party/dom_distiller_js'
           'third_party/ffmpeg'
           'third_party/fips181'
           'third_party/flatbuffers'
           'third_party/flot'
           'third_party/freetype'
           'third_party/glslang'
           'third_party/glslang-angle'
           'third_party/google_input_tools'
           'third_party/google_input_tools/third_party/closure_library'
           'third_party/google_input_tools/third_party/closure_library/third_party/closure'
           'third_party/googletest'
           'third_party/hunspell'
           'third_party/iccjpeg'
           'third_party/inspector_protocol'
           'third_party/jinja2'
           'third_party/jstemplate'
           'third_party/khronos'
           'third_party/leveldatabase'
           'third_party/libXNVCtrl'
           'third_party/libaddressinput'
           'third_party/libaom'
           'third_party/libaom/source/libaom/third_party/x86inc'
           'third_party/libjingle'
           'third_party/libphonenumber'
           'third_party/libsecret'
           'third_party/libsrtp'
           'third_party/libudev'
           'third_party/libvpx'
           'third_party/libvpx/source/libvpx/third_party/x86inc'
           'third_party/libwebm'
           'third_party/libxml/chromium'
           'third_party/libyuv'
           'third_party/llvm'
           'third_party/lss'
           'third_party/lzma_sdk'
           'third_party/markupsafe'
           'third_party/mesa'
           'third_party/metrics_proto'
           'third_party/modp_b64'
           'third_party/node'
           'third_party/node/node_modules/polymer-bundler/lib/third_party/UglifyJS2'
           'third_party/openmax_dl'
           'third_party/ots'
           'third_party/pdfium'
           'third_party/pdfium/third_party/agg23'
           'third_party/pdfium/third_party/base'
           'third_party/pdfium/third_party/bigint'
           'third_party/pdfium/third_party/eu-strip'
           'third_party/pdfium/third_party/freetype'
           'third_party/pdfium/third_party/lcms'
           'third_party/pdfium/third_party/libopenjpeg20'
           'third_party/pdfium/third_party/libpng16'
           'third_party/pdfium/third_party/libtiff'
           'third_party/pdfium/third_party/skia_shared'
           'third_party/ply'
           'third_party/polymer'
           'third_party/protobuf'
           'third_party/protobuf/third_party/six'
           'third_party/qcms'
           'third_party/s2cellid'
           'third_party/sfntly'
           'third_party/shaderc'
           'third_party/skia'
           'third_party/skia/third_party/gif'
           'third_party/skia/third_party/spirv-headers'
           'third_party/skia/third_party/spirv-tools'
           'third_party/skia/third_party/vulkan'
           'third_party/smhasher'
           'third_party/spirv-headers'
           'third_party/SPIRV-Tools'
           'third_party/spirv-tools-angle'
           'third_party/sqlite'
           'third_party/swiftshader'
           'third_party/swiftshader/third_party/llvm-subzero'
           'third_party/swiftshader/third_party/subzero'
           'third_party/tcmalloc'
           'third_party/unrar'
           'third_party/usrsctp'
           'third_party/vulkan-validation-layers'
           'third_party/vulkan'
           'third_party/web-animations-js'
           'third_party/webdriver'
           'third_party/webrtc'
           'third_party/widevine'
           'third_party/woff2'
           'third_party/zlib/google'

           'url/third_party/mozilla'
           'v8/src/third_party/valgrind'
           'v8/src/third_party/utf8-decoder'
           'v8/third_party/inspector_protocol'

           # gyp -> gn leftovers
           'base/third_party/libevent'
           'third_party/adobe'
           'third_party/speech-dispatcher'
           'third_party/usb_ids'
           'third_party/xdg-utils'
           'third_party/yasm/run_yasm.py'
           )

# Set build flags.
_flags=(
        "custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
        "host_toolchain=\"//build/toolchain/linux/unbundle:default\""
        'is_clang=true'
        'is_debug=false'
        'is_cfi=true'
#         'enable_widevine=true'
        'enable_hangout_services_extension=true'
        "ffmpeg_branding=\"ChromeOS\""
        'proprietary_codecs=true'
        "google_api_key=\"${_google_api_key}\""
        "google_default_client_id=\"${_google_default_client_id}\""
        "google_default_client_secret=\"${_google_default_client_secret}\""
        'fieldtrial_testing_like_official_build=true'
        'remove_webcore_debug_symbols=true'
        'use_gtk3=true'
        "use_gio=false"
        "use_gnome_keyring=false"
        'link_pulseaudio=true'
        'use_sysroot=false'
        'use_gold=false'
        'linux_use_bundled_binutils=false'
        'fatal_linker_warnings=false'
        'treat_warnings_as_errors=false'
        'enable_nacl=true'
        'enable_nacl_nonsfi=true'
        'use_custom_libcxx=false'
        'use_jumbo_build=false' # https://chromium.googlesource.com/chromium/src/+/lkcr/docs/jumbo.md
        'enable_vulkan=true'
        'use_vaapi=true'
        )

if [ "${_wayland}" = "1" ]; then
  _flags+=(
           'use_ozone=true'
           'use_xkbcommon=true'
           'enable_package_mash_services=true'
           'enable_vulkan_wayland_client=true'
           )
fi

# Set the bundled/external components.
# TODO: need ported to GN as GYP doing before. see status page: https://crbug.com/551343
_use_system=(
#              'ffmpeg'      # I'm not sure why, but all videos stop playbackl if use system ffmpeg
             'flac'
             'fontconfig'
             'freetype'
             'harfbuzz-ng'
#              'icu'         # https://crbug.com/678661
             'libdrm'
#              'libevent'    # Get segfaults and other problems https://bugs.gentoo.org/593458
             'libjpeg'
             'libpng'
#              'libvpx'      # Needs update
             'libwebp'
             'libxml'
             'libxslt'
             'openh264'
             'opus'
             're2'
             'snappy'
             'yasm'
             'zlib'
             )

# https://crbug.com/678661
_keeplibs+=(
            'third_party/icu'
            )

# Conditionals.
if check_option strip y; then
  CFLAGS+=' -fno-unwind-tables -fno-asynchronous-unwind-tables'
  CXXFLAGS+=' -fno-unwind-tables -fno-asynchronous-unwind-tables'
  CPPFLAGS+=' -DNO_UNWIND_TABLES'
fi

if check_buildoption ccache y; then
  # Avoid falling back to preprocessor mode when sources contain time macros
  export CCACHE_CPP2=yes
  export CCACHE_SLOPPINESS=time_macros
fi

################################################

prepare() {

  # Set Python2 path.
  mkdir -p python-path
  ln -sf /usr/bin/python2 "${srcdir}/python-path/python"
  export PATH="${srcdir}/python-path:$PATH"

  cd "${srcdir}/chromium-${pkgver}"

  # Use chromium-dev as branch name.
  sed -e 's|filename = "chromium-browser"|filename = "chromium-dev"|' \
      -e 's|confdir = "chromium|&-dev|' \
      -i chrome/BUILD.gn
  sed -e 's|config_dir.Append("chromium|&-dev|' \
      -i chrome/common/chrome_paths_linux.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -e 's|/usr/share/chromium|&-dev|' \
      -i chrome/common/chrome_paths.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -i components/policy/tools/template_writers/writer_configuration.py

  msg2 "Patching the sources"
  # Patch sources from Gentoo.
  patch -p1 -i "${srcdir}/chromium-FORTIFY_SOURCE-r2.patch"
  patch -p1 -i "${srcdir}/chromium-webrtc-r0.patch"
  patch -p1 -i "${srcdir}/chromium-clang-r2.patch"
  patch -p1 -i "${srcdir}/chromium-ffmpeg-r1.patch"

  # Pats to chromium dev's about why always they forget add/remove missing build rules
  base64 -d "${srcdir}/fix_gn.diff.base64" | patch -p1 -i -

  # https://crbug.com/710701
  _chrome_build_hash=$(curl -s "https://chromium.googlesource.com/chromium/src.git/+/${pkgver}?format=TEXT")
  _chrome_build_hash=$(echo $_chrome_build_hash | base64 -d | grep -Po '^parent \K[0-9a-f]{40}$')
  if [[ -z $_chrome_build_hash ]]; then
    error "Unable to fetch Chrome build hash."
    return 1
  fi
  echo "LASTCHANGE=$_chrome_build_hash-" > build/util/LASTCHANGE

  # Setup vulkan
  export VULKAN_SDK="/usr"
  sed 's|/x86_64-linux-gnu||' -i gpu/vulkan/BUILD.gn

  # https://chromium-review.googlesource.com/c/chromium/src/+/532294
  #base64 -d "${srcdir}/chromium-intel-vaapi_r17.diff.base64" | patch -p1 -i -

  # Patch from crbug (chromium bugtracker) or Arch chromium package

  # https://crbug.com/skia/6663#c10
  patch -Np4 -i "${srcdir}/chromium-skia-harmony.patch"

  # https://crbug.com/473866
  patch -p0 -i "${srcdir}/chromium-widevine-r1.patch"
  sed 's|@WIDEVINE_VERSION@|The Cake Is a Lie|g' -i third_party/widevine/cdm/stub/widevine_cdm_version.h

  # Setup nodejs dependency
  mkdir -p third_party/node/linux/node-linux-x64/bin/
  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin/node

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save space."
  python2 build/linux/unbundle/remove_bundled_libraries.py ${_keeplibs[@]} --do-remove

  msg2 "Make sure use Python2"
  find -name '*.py' | xargs sed -e 's|env python|&2|g' -e 's|bin/python|&2|g' -i

  msg2 "Changing bundle libraries to system ones."
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries ${_use_system[@]}

  # Use the file at run time instead of effectively compiling it in.
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' -i device/usb/BUILD.gn

  msg2 "Setup NaCl/PNaCl SDK: Download and install NaCl/PNaCl toolchains"
  python2 build/download_nacl_toolchains.py --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract
}

build() {

  msg2 "Build the Launcher"
  make -C chromium-launcher \
          CHROMIUM_SUFFIX="-dev"

  cd "chromium-${pkgver}"

  msg2 "Download external build components from google"
  python2 tools/clang/scripts/update.py --without-android #--force-local-build --use-system-cmake --if-needed --gcc-toolchain=/usr --skip-checkout

  msg2 "Setup compiler"

  if [ "${_use_bundled_clang}" = "0" ]; then
    _flags+=(
             'clang_use_chrome_plugins=false'
             )
  elif [ "${_use_bundled_clang}" = "1" ]; then
    _flags+=(
             'clang_use_chrome_plugins=true'
            )
    _clang_path="${srcdir}/chromium-${pkgver}/third_party/llvm-build/Release+Asserts/bin/"
    # Bundled clang not like this
    export CXXFLAGS="${CXXFLAGS//-fno-plt/}"
    export CFLAGS="${CFLAGS//-fno-plt/}"
  fi

  export CC="${_clang_path}clang"
  export CXX="${_clang_path}clang++"
  export AR=ar
  export NM=nm

  #echo ${_flags[@]}

  msg2 "Configure bundled ffmpeg"
  pushd third_party/ffmpeg > /dev/null
  # use system opus
  sed -e "s|CHROMIUM_ROOT_DIR, 'third_party/opus/src/include'|'/usr/include/opus'|g" -i chromium/scripts/build_ffmpeg.py
  chromium/scripts/build_ffmpeg.py linux x64 --branding ChromeOS
  chromium/scripts/copy_config.sh
  chromium/scripts/generate_gn.py
  popd > /dev/null

  msg2 "Build GN"
  python2 tools/gn/bootstrap/bootstrap.py -v -s --no-clean

  msg2 "Starting building Chromium..."
  LC_ALL=C out/Release/gn gen out/Release -v --args="${_flags[*]}" --script-executable=/usr/bin/python2

  # Build all with ninja.
  LC_ALL=C ninja -C out/Release -v chrome chrome_sandbox chromedriver #widevinecdmadapter
}

package() {
  # Install launcher.
  make -C chromium-launcher \
    PREFIX=/usr \
    CHROMIUM_SUFFIX="-dev" \
    DESTDIR="${pkgdir}" \
    install
  install -Dm644 "chromium-launcher/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"

  pushd "chromium-${pkgver}/out/Release" &> /dev/null

  # Set info
  source "${srcdir}/chromium-${pkgver}/chrome/installer/linux/common/installer.include"
  PACKAGE=chromium-dev
  PROGNAME=chromium-dev
  MENUNAME="Chromium-dev Web Browser"
  USR_BIN_SYMLINK_NAME=chromium-dev

  # Install binaries.
  install -Dm755 chrome "${pkgdir}/usr/lib/chromium-dev/chromium-dev"
  install -Dm4755 chrome_sandbox "${pkgdir}/usr/lib/chromium-dev/chrome-sandbox"
  install -Dm755 chromedriver "${pkgdir}/usr/lib/chromium-dev/chromedriver"
  ln -sf /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs.
  _libs=(
         'libEGL.so'
         'libGLESv2.so'
         'libVkLayer_core_validation.so'
         'libVkLayer_object_tracker.so'
         'libVkLayer_parameter_validation.so'
         'libVkLayer_threading.so'
         'libVkLayer_unique_objects.so'
#          'libwidevinecdmadapter.so'
         'swiftshader/libEGL.so'
         'swiftshader/libGLESv2.so'
         )
  for i in "${_libs[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  _blobs=(
          'natives_blob.bin'
          'snapshot_blob.bin'
          'v8_context_snapshot.bin'
          'icudtl.dat'
          #
          'MEIPreload/manifest.json'
          'MEIPreload/preloaded_data.pb'
          )
  for i in "${_blobs[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Install NaCL
  _nacl_libs=(
              'nacl_helper'
              'nacl_helper_bootstrap'
              'nacl_helper_nonsfi'
              'nacl_irt_x86_64.nexe'
              )
  for i in "${_nacl_libs[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Install Resources.
  _resources=(
              'chrome_100_percent.pak'
              'chrome_200_percent.pak'
              'headless_lib.pak'
              'keyboard_resources.pak'
              'resources.pak'
              'views_mus_resources.pak'
              )
  for i in "${_resources[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  find resources -type f -name "*" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;

  # Install .desktop and manpages
  process_template "${srcdir}/chromium-${pkgver}/chrome/app/resources/manpage.1.in" chromium-dev.1
  install -Dm644 chromium-dev.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  process_template "${srcdir}/chromium-${pkgver}/chrome/installer/linux/common/desktop.template" chromium-dev.desktop
  install -Dm644 chromium-dev.desktop "${pkgdir}/usr/share/applications/chromium-dev.desktop"

  # Install locales.
  find locales -type f -name "*.pak" -exec install -Dm644 '{}' "${pkgdir}/usr/lib/chromium-dev/{}" \;

  # Install icons.
  for _size in 16 22 24 32 48 128 256; do
    case "${_size}" in
      16|32) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/default_100_percent/chromium" ;;
      *) _branding="${srcdir}/chromium-${pkgver}/chrome/app/theme/chromium" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/chromium-dev.png"
  done
  install -Dm644 "${srcdir}/chromium-dev.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"

  popd &> /dev/null

  # Install License
  install -Dm644 "chromium-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"
}
