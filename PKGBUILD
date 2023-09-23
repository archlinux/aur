# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Nagisa <simonas@kazlauskas.me>
# Contributor: Misc <andreas.reis@gmail.com>
# Contributor: Jeagoss <jgoliver@jeago.com>
# Contributor: Saikrishna Arcot <saiarcot895@gmail.com> and Steven Newbury <steve@snewbury.org.uk> (First Authors of VAAPI patch)

_USE_QT=0
_USE_QT5=0
_USE_QT6=0
_USE_GTK=0
_VERBOSE_OUTPUT=0

##############################################
## -- Package and components information -- ##
##############################################
pkgname=chromium-dev
pkgver=119.0.6020.3
pkgrel=1
pkgdesc="The open-source project behind Google Chrome (Dev Channel)"
arch=('x86_64')
url='http://www.chromium.org'
license=('BSD')
depends=(
   'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
   'glibc' # 'ld-linux-x86-64.so' 'libc.so' 'libm.so'
   'flac' 'libFLAC.so'
   'alsa-lib' 'libasound.so'
   'at-spi2-core' 'libatk-1.0.so' 'libatk-bridge-2.0.so' 'libatspi.so'
#  'brotli' 'libbrotlidec.so'
   'libcups' # 'libcups.so'
   'dbus' 'libdbus-1.so'
   'libdrm' # 'libdrm.so'
   'expat' 'libexpat.so'
   'libffi' 'libffi.so'
   'libfontconfig.so' 'libfontconfig.so'
#    'freetype2' 'libfreetype.so'
   'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
   'harfbuzz' 'libharfbuzz-subset.so' 'libharfbuzz.so'
   'libjpeg-turbo' 'libjpeg.so'
   'lcms2' 'liblcms2.so'
   'openh264' 'libopenh264.so'
   'opus' 'libopus.so'
   'pango' 'libpango-1.0.so'
   'libpipewire' 'libpipewire-0.3.so'
   'libpng' 'libpng16.so'
   'libpulse' 'libpulse.so'
   'libwebp' 'libwebp.so' 'libwebpdemux.so' 'libwebpmux.so'
   'libx11' # 'libX11.so'
   'libxcb' # 'libxcb.so'
   'libxcomposite' # 'libXcomposite.so'
   'libxdamage' # 'libXdamage.so'
   'libxext' # 'libXext.so'
   'libxfixes' # 'libXfixes.so'
   'libxkbcommon' 'libxkbcommon.so'
   'libxml2' 'libxml2.so'
   'libxrandr' # 'libXrandr.so'
   'libxtst' # 'libXtst.so'
   'libxslt' 'libxslt.so'
   'mesa' # 'libgbm.so'
   'nspr' # 'libnspr4.so'
   'nss' # 'libnss3.so' 'libnssutil3.so' 'libsmime3.so'
   'openjpeg2' # 'libopenjp2.so'
   'hicolor-icon-theme'
   'pciutils'
   'xdg-utils'
#   'double-conversion'
#   'dav1d' 'libdav1d.so'
#   'libyuv' 'libyuv.so'
#   'jsoncpp' 'libjsoncpp.so'
#   'aom' 'libaom.so'
#   'libvpx' 'libvpx.so'
#   'libva'
#   'protobuf'
#   'libevent' 'libevent-2.1.so'  'libevent_core-2.1.so'  'libevent_extra-2.1.so'  'libevent_openssl-2.1.so'  'libevent_pthreads-2.1.so'
#   'ffmpeg' 'libavcodec.so'  'libavdevice.so'  'libavfilter.so'  'libavformat.so'  'libavutil.so'  'libpostproc.so'  'libswresample.so' 'libswscale.so'
#   'icu'       # https://crbug.com/678661.
#   're2' 'libre2.so'
#   'snappy'
#   'minizip'
#   'libsrtp' 'libsrtp2.so'
)
makedepends=(
  'gperf'
  'ninja'
  'python-protobuf'
  'python-setuptools'
  'yasm'
  'nasm'
  'git'
  'gn'
  'hwdata'
  'java-runtime-headless'
#  'abseil-cpp'
#  'woff2'
)
optdepends=(
 'pepper-flash: PPAPI Flash Player'
 'chromium-widevine: Widevine plugin (eg: Netflix)'
 'xdg-desktop-portal-gnome: GNOME portal support'
 'xdg-desktop-portal-kde: KDE portal support'
 #
 'org.freedesktop.secrets: password storage backend on GNOME/Xfce/KDE'
 #
 'ttf-font: For some typography'
 'pipewire: WebRTC desktop sharing under Wayland'
 )
source=(
#  "https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
#  "https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
  "chromium::git+https://github.com/chromium/chromium.git#tag=${pkgver}"
  'git+https://github.com/foutrelis/chromium-launcher.git'
  'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#branch=main'
  'chromium-dev.svg'
  'gclient_args.gni'
  # Patch form Gentoo.
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-cross-compile.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-108-EnumTable-crash.patch'
  'https://raw.githubusercontent.com/gentoo/gentoo/master/www-client/chromium/files/chromium-111-InkDropHost-crash.patch'
  # Misc Patches.

  # Patch from crbug.com (chromium bugtracker), chromium-review.googlesource.com / Gerrit or Arch chromium package.
  'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/chromium/trunk/use-oauth2-client-switches-as-default.patch'
  'system-opus.diff'
)
sha256sums=(
#  "$(curl -sL https://gsdview.appspot.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
#  "$(curl -sL https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz.hashes | grep sha256 | cut -d ' ' -f3)"
  'SKIP'
  'SKIP'
  'SKIP'
  '18a2dfc0a56b2fbbeb8ef16a19227b77bf9a6621c6021d04396e52a9a2313034'
  '8c403dd7d732e39b6660b3d841338794a9583fab75d597db13f53ad987b2e8d5'
  # Patch form Gentoo
  '9f8e90672e7914e1974ea73de48336800204a188b94d8b03e3ddd64a97f5e630'
  '779861e51506a29d4a46c9380c0793bb3297624e47536cb8e71240818e7dd093'
  '960556d2b337e091a2954f14ba00b2f67ec7d54c2ff54302f98dcb9830ccd97f'
  # Misc Patches
#
  # Patch from crbug (chromium bugtracker) or Arch chromium package
  'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711'
  '01aea13760430d1c6dee97faeabc52ac0d94f888fb2215ae33468ebc0e11558d'
)
options=('debug' '!lto') # Chromium adds its own flags for ThinLTO
install=chromium-dev.install

_keeplibs=()
_flags=()
_use_system=()

if [ "${_USE_QT}" == "1" ]; then
  _flags+=('use_qt=true')
  if [ "${_USE_QT5}" == "1" ]; then
    depends+=('qt5-base') # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Widgets.so')
    makedepends+=('qt5-tools')
  fi
  if [ "${_USE_QT6}" == "1" ]; then
    depends+=('qt6-base') # 'libQt6Core.so' 'libQt6Gui.so' 'libQt6Widgets.so')
    makedepends+=('qt6-tools')
  fi
    if [ "${_USE_QT5}" == "1" ]; then
      _flags+=(
        'use_qt6=false'
        "moc_qt5_path=\"$(qtpaths --binaries-dir)\""
      )
    fi
    if [ "${_USE_QT6}" == "1" ]; then
      _flags+=(
        'use_qt6=true'
        "moc_qt6_path=\"/usr/lib/qt6\""
      )
    fi
else
  _flags+=('use_qt=false')
fi
if [ "${_USE_GTK}" == "1" ]; then
  depends+=(
    'cairo' 'libcairo.so'
    'libgio-2.0.so'
    'libxslt' 'libxslt.so'
  )
  makedepends+=(
    'gtk3'
#    'gtk4'
  )
  _flags+=(
    'use_gtk=true'
    'use_gio=true'
    'gtk_version=3'
#     'gtk_version=4'
    'enable_remoting=true'
)
else
  _flags+=(
    'use_gtk=false'
    'use_gio=false'
    'enable_remoting=false' # side-efect if disable GTK :(
  )
fi

if [ "${_VERBOSE_OUTPUT}" == "1" ]; then
  _verbose_ffmpeg="'V=1',"
  _verbose_output="-v"
fi


################################################
## -- Don't touch anything below this line -- ##
################################################

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# NOTE: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
#_google_default_client_id="413772536636.apps.googleusercontent.com"
#_google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

# List of third-party components neededs keep for build chromium. The rest is removed by remove_bundled_libraries srcipt in prepare().
_keeplibs+=(
  'base/third_party/cityhash'
  'base/third_party/double_conversion'
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
  'net/third_party/quic'
  'net/third_party/uri_template'
  'third_party/abseil-cpp'
  'third_party/angle'
  'third_party/angle/src/common/third_party/xxhash'
  'third_party/angle/src/third_party/ceval'
  'third_party/angle/src/third_party/libXNVCtrl'
  'third_party/angle/src/third_party/volk'
  'third_party/apple_apsl'
  'third_party/axe-core'
  'third_party/blink'
  'third_party/bidimapper'
  'third_party/boringssl'
  'third_party/boringssl/src/third_party/fiat'
  'third_party/breakpad'
  'third_party/breakpad/breakpad/src/third_party/curl'
  'third_party/brotli'
  'third_party/catapult'
  'third_party/catapult/common/py_vulcanize/third_party/rcssmin'
  'third_party/catapult/common/py_vulcanize/third_party/rjsmin'
  'third_party/catapult/third_party/beautifulsoup4-4.9.3'
  'third_party/catapult/third_party/html5lib-1.1'
  'third_party/catapult/third_party/polymer'
  'third_party/catapult/third_party/six'
  'third_party/catapult/tracing/third_party/d3'
  'third_party/catapult/tracing/third_party/gl-matrix'
  'third_party/catapult/tracing/third_party/jpeg-js'
  'third_party/catapult/tracing/third_party/jszip'
  'third_party/catapult/tracing/third_party/mannwhitneyu'
  'third_party/catapult/tracing/third_party/oboe'
  'third_party/catapult/tracing/third_party/pako'
  'third_party/ced'
  'third_party/cld_3'
  'third_party/closure_compiler'
  'third_party/content_analysis_sdk'
  'third_party/cpuinfo'
  'third_party/crashpad'
  'third_party/crashpad/crashpad/third_party/lss'
  'third_party/crashpad/crashpad/third_party/zlib'
  'third_party/crc32c'
  'third_party/cros_system_api'
  'third_party/d3'
  'third_party/dav1d'
  'third_party/dawn'
  'third_party/dawn/third_party/gn/webgpu-cts'
  'third_party/dawn/third_party/khronos'
  'third_party/depot_tools'
  'third_party/depot_tools'
  'third_party/depot_tools/third_party/colorama'
  'third_party/depot_tools/third_party/repo'
  'third_party/depot_tools/third_party/schema'
  'third_party/devscripts'
  'third_party/devtools-frontend'
  'third_party/devtools-frontend/src/front_end/third_party/acorn'
  'third_party/devtools-frontend/src/front_end/third_party/additional_readme_paths.json'
  'third_party/devtools-frontend/src/front_end/third_party/axe-core'
  'third_party/devtools-frontend/src/front_end/third_party/chromium'
  'third_party/devtools-frontend/src/front_end/third_party/codemirror'
  'third_party/devtools-frontend/src/front_end/third_party/codemirror.next'
  'third_party/devtools-frontend/src/front_end/third_party/diff'
  'third_party/devtools-frontend/src/front_end/third_party/i18n'
  'third_party/devtools-frontend/src/front_end/third_party/intl-messageformat'
  'third_party/devtools-frontend/src/front_end/third_party/lighthouse'
  'third_party/devtools-frontend/src/front_end/third_party/lit'
  'third_party/devtools-frontend/src/front_end/third_party/lodash-isequal'
  'third_party/devtools-frontend/src/front_end/third_party/marked'
  'third_party/devtools-frontend/src/front_end/third_party/puppeteer'
  'third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/mitt'
  'third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/rxjs'
  'third_party/devtools-frontend/src/front_end/third_party/vscode.web-custom-data'
  'third_party/devtools-frontend/src/front_end/third_party/wasmparser'
  'third_party/devtools-frontend/src/test/unittests/front_end/third_party/i18n'
  'third_party/devtools-frontend/src/third_party'
  'third_party/distributed_point_functions'
  'third_party/dom_distiller_js'
  'third_party/eigen3'
  'third_party/emoji-segmenter'
  'third_party/farmhash'
  'third_party/fdlibm'
  'third_party/fft2d'
  'third_party/ffmpeg'
  'third_party/flatbuffers'
  'third_party/fp16'
  'third_party/freetype'
  'third_party/freetype-testing'
  'third_party/fusejs'
  'third_party/fxdiv'
  'third_party/gemmlowp'
  'third_party/google_input_tools'
  'third_party/google_input_tools/third_party/closure_library'
  'third_party/google_input_tools/third_party/closure_library/third_party/closure'
  'third_party/googletest'
  'third_party/harfbuzz-ng'
  'third_party/highway'
  'third_party/hunspell'
  'third_party/iccjpeg'
  'third_party/icu' # https://crbug.com/678661.
  'third_party/inspector_protocol'
  'third_party/ipcz'
  'third_party/jinja2'
  'third_party/jsoncpp'
  'third_party/jstemplate'
  'third_party/khronos'
  'third_party/leveldatabase'
  'third_party/libaddressinput'
  'third_party/libaom'
  'third_party/libaom/source/libaom/third_party/fastfeat'
  'third_party/libaom/source/libaom/third_party/SVT-AV1'
  'third_party/libaom/source/libaom/third_party/vector'
  'third_party/libaom/source/libaom/third_party/x86inc'
  'third_party/libavif'
  'third_party/libc++'
  'third_party/libevent'
  'third_party/libgav1'
  'third_party/libjingle'
  'third_party/libphonenumber'
  'third_party/libsecret'
  'third_party/libsrtp'
  'third_party/libsync'
  'third_party/libudev'
  'third_party/liburlpattern'
  'third_party/libva_protected_content'
  'third_party/libvpx'
  'third_party/libvpx/source/libvpx/third_party/x86inc'
  'third_party/libwebm'
  'third_party/libx11'
  'third_party/libxcb-keysyms'
  'third_party/libxml/chromium'
  'third_party/libyuv'
  'third_party/libzip'
#   'third_party/llvm'
  'third_party/lottie'
  'third_party/lss'
  'third_party/lzma_sdk'
  'third_party/mako'
  'third_party/maldoca'
  'third_party/maldoca/src/third_party/tensorflow_protos'
  'third_party/maldoca/src/third_party/zlibwrapper'
  'third_party/markupsafe'
  'third_party/material_color_utilities'
  'third_party/mesa'
  'third_party/metrics_proto'
  'third_party/minigbm'
  'third_party/modp_b64'
  'third_party/nasm'
  'third_party/nearby'
  'third_party/neon_2_sse'
  'third_party/node'
  'third_party/omnibox_proto'
  'third_party/one_euro_filter'
  'third_party/openscreen'
  'third_party/openscreen/src/third_party/mozilla'
  'third_party/ots'
  'third_party/pdfium'
  'third_party/pdfium/third_party/agg23'
  'third_party/pdfium/third_party/base'
  'third_party/pdfium/third_party/bigint'
  'third_party/pdfium/third_party/freetype'
  'third_party/pdfium/third_party/lcms'
  'third_party/pdfium/third_party/libopenjpeg'
  'third_party/pdfium/third_party/libtiff'
  'third_party/perfetto'
  'third_party/perfetto/protos/third_party/chromium'
  'third_party/pffft'
  'third_party/ply'
  'third_party/polymer'
  'third_party/private-join-and-compute'
  'third_party/private_membership'
  'third_party/protobuf'
  'third_party/pthreadpool'
  'third_party/puffin'
  'third_party/pyjson5'
  'third_party/pyyaml'
  'third_party/qcms'
  'third_party/re2'
  'third_party/rnnoise'
  'third_party/rust'
  'third_party/s2cellid'
  'third_party/securemessage'
  'third_party/selenium-atoms'
  'third_party/shell-encryption'
  'third_party/simplejson'
  'third_party/skia'
  'third_party/skia/include/third_party/vulkan'
  'third_party/skia/third_party/vulkanmemoryallocator'
  'third_party/smhasher'
  'third_party/sqlite'
#  'third_party/swiftshader'
#  'third_party/swiftshader/third_party/astc-encoder'
#  'third_party/swiftshader/third_party/llvm-subzero'
#  'third_party/swiftshader/third_party/marl'
#  'third_party/swiftshader/third_party/subzero'
#  'third_party/swiftshader/third_party/SPIRV-Headers'
#  'third_party/swiftshader/third_party/SPIRV-Tools'
  'third_party/tensorflow_models'
  'third_party/tensorflow-text'
  'third_party/tflite'
  'third_party/tflite/src/third_party/eigen3'
  'third_party/tflite/src/third_party/fft2d'
  'third_party/tflite/src/third_party/xla/third_party/tsl'
  'third_party/ruy'
  'third_party/six'
  'third_party/snappy'
  'third_party/ukey2'
  'third_party/unrar'
  'third_party/utf'
  'third_party/vulkan-deps'
  'third_party/vulkan_memory_allocator'
  'third_party/wayland'
  'third_party/webdriver'
  'third_party/webgpu-cts'
  'third_party/webrtc'
  'third_party/webrtc/common_audio/third_party/ooura'
  'third_party/webrtc/common_audio/third_party/spl_sqrt_floor'
  'third_party/webrtc/modules/third_party/fft'
  'third_party/webrtc/modules/third_party/g711'
  'third_party/webrtc/modules/third_party/g722'
  'third_party/webrtc/rtc_base/third_party/base64'
  'third_party/webrtc/rtc_base/third_party/sigslot'
  'third_party/widevine'
  'third_party/woff2'
  'third_party/wuffs'
  'third_party/x11proto'
  'third_party/xcbproto'
  'third_party/xnnpack'
  'third_party/zlib' # /google
  'third_party/zstd'
  'third_party/zxcvbn-cpp'
  'url/third_party/mozilla'
  'v8/src/third_party/siphash'
  'v8/src/third_party/valgrind'
  'v8/src/third_party/utf8-decoder'
  'v8/third_party/glibc'
  'v8/third_party/inspector_protocol'
  'v8/third_party/v8'

  # gyp -> gn leftovers.
  'third_party/speech-dispatcher'
  'third_party/usb_ids'
  'third_party/xdg-utils'
)

# Set build flags.
_flags+=(
  "custom_toolchain=\"//build/toolchain/linux/unbundle:default\""
  "host_toolchain=\"//build/toolchain/linux/unbundle:default\""
  'is_debug=false'
  'symbol_level=0' # sufficient for backtraces on x86(_64)
  'is_official_build=false'
  'chrome_pgo_phase=0' # unsupported instrumentation profile format version
  'is_component_build=true'
  'enable_widevine=true'
  'enable_hangout_services_extension=true'
  "ffmpeg_branding=\"ChromeOS\""
  'proprietary_codecs=true'
  "google_api_key=\"${_google_api_key}\""
#  "google_default_client_id=\"${_google_default_client_id}\""
#  "google_default_client_secret=\"${_google_default_client_secret}\""
  'disable_fieldtrial_testing_config=true'
  'blink_enable_generated_code_formatting=false'
  'blink_symbol_level=0'
  'use_cups=true'
  'use_kerberos=true'
  'use_pulseaudio=true'
  'link_pulseaudio=true'
  'use_vaapi=true'
  'rtc_use_pipewire=true'
  'rtc_link_pipewire=true'
  'use_dbus=true'
  'use_sysroot=false'
  'use_gold=false'
  'treat_warnings_as_errors=false'
  'enable_nacl=true'
  'use_custom_libcxx=true' # use true if you want use bundled RE2
  'enable_platform_hevc=true'
  'enable_platform_ac3_eac3_audio=true'
  'enable_platform_mpeg_h_audio=true'
  'enable_platform_dolby_vision=true'
  'enable_mse_mpeg2ts_stream_parser=true'
  'is_clang=true'
  'clang_use_chrome_plugins=false'
  'enable_pseudolocales=false'
  'dcheck_always_on=false'
  'dcheck_is_configurable=false'
  'use_system_harfbuzz=true'
  'use_system_freetype=false'
  'use_system_lcms2=true'
  'use_system_libpng=true'
  'use_system_libsync=false'
  'use_system_libopenjpeg2=true'
  'use_system_libffi=true'
  'v8_use_libm_trig_functions=true'
  'angle_link_glx=true'
  'angle_enable_gl_desktop_frontend=true'
  'angle_enable_swiftshader=false'
  'angle_use_custom_libvulkan=false'
  'enable_swiftshader=false'
  'enable_swiftshader_vulkan=false'
  'dawn_use_swiftshader=false'
)

# Set the bundled/external components.
# list of unbundled options:
# https://chromium.googlesource.com/chromium/src/+/refs/tags/${pkgver}/build/linux/unbundle/
_use_system+=(
#  'absl_algorithm'          # NaCL needs the bundled one
#  'absl_base'               # NaCL needs the bundled one
#  'absl_cleanup'            # NaCL needs the bundled one
#  'absl_container'          # NaCL needs the bundled one
#  'absl_debugging'          # NaCL needs the bundled one
#  'absl_flags'              # NaCL needs the bundled one
#  'absl_functional'         # NaCL needs the bundled one
#  'absl_hash'               # NaCL needs the bundled one
#  'absl_log'                # NaCL needs the bundled one
#  'absl_log_internal'       # NaCL needs the bundled one
#  'absl_memory'             # NaCL needs the bundled one
#  'absl_meta'               # NaCL needs the bundled one
#  'absl_numeric'            # NaCL needs the bundled one
#  'absl_random'             # NaCL needs the bundled one
#  'absl_status'             # NaCL needs the bundled one
#  'absl_strings'            # NaCL needs the bundled one
#  'absl_synchronization'    # NaCL needs the bundled one
#  'absl_time'               # NaCL needs the bundled one
#  'absl_types'              # NaCL needs the bundled one
#  'absl_utility'            # NaCL needs the bundled one
#  'brotli'                  # needs update
#  'crc32c'
#  'dav1d'                   # Fails due undeclared identifier
#  'double-conversion'       # NaCL needs the bundled one
#  'ffmpeg'                  # I'm not sure why, but all videos stop playback if use system ffmpeg.
  'flac'
  'fontconfig'
#  'freetype'                # neeeds private headers
  'harfbuzz-ng'
#  'icu'                     # https://crbug.com/678661.
#  'jsoncpp'                 # Fails due undefined symbols
#  'libaom'                  # Fails due undeclared identifier
#  'libavif'                 # Fails due undeclared identifier
  'libdrm'
#  'libevent'                # Get segfaults and other problems https://bugs.gentoo.org/593458.
  'libjpeg'
  'libpng'
#  'libvpx'                  # Some components hardcode the bundled code
  'libwebp'
  'libxml'
#  'libXNVCtrl.gn'
  'libxslt'
#  'libyuv'                  # Missing pkg-config file
  'openh264'
  'opus'
#  're2'                     # Needs disable if build with clang
#  'snappy'                  # Needs disable if build with clang
  'swiftshader-SPIRV-Headers'
#  'swiftshader-SPIRV-Tools' # Fails due undefined symbols
  'vulkan-SPIRV-Headers'
#  'vulkan-SPIRV-Tools'      # Fails due undefined symbols
#  'woff2'                   # Fails due undefined symbols
#  'zlib'                    # NaCL needs the bundled one
)

# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn).
CFLAGS+=' -Wno-builtin-macro-redefined'
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

# Seems bundled clang don't like Debug flag -fvar-tracking-assignments.
DEBUG_CFLAGS=${DEBUG_CFLAGS/-fvar-tracking-assignments}
DEBUG_CXXFLAGS=${DEBUG_CXXFLAGS/-fvar-tracking-assignments}

if check_buildoption ccache y; then
  # Avoid falling back to preprocessor mode when sources contain time macros.
  export CCACHE_CPP2=yes
  export CCACHE_SLOPPINESS=time_macros
  _flags+=("cc_wrapper=\"ccache\"")
fi

if [ ! -f "${BUILDDIR}/PKGBUILD" ]; then
  _builddir="/${pkgname}"
fi

_clang_path="${BUILDDIR}${_builddir}/src/chromium/third_party/llvm-build/Release+Asserts/bin/"

export CC="${_clang_path}clang"
export CXX="${_clang_path}clang++"
export AR="${_clang_path}llvm-ar"
export NM=nm
export RANLIB=/usr/bin/true
_lld="ld.lld"

################################################

prepare() {

  cat >.gclient <<EOF
solutions = [
  {
    "name": "src",
    "url": "file://${srcdir}/chromium",
    "deps_file": "DEPS",
    "managed": False,
    "custom_deps": {
      "src": None,
    },
    "custom_vars": {},
  },
]
EOF

  export PATH+=":${PWD}/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Linking chromium from sources..."
  ln -s chromium src

  depot_tools/gclient.py sync -D \
      --nohooks \
      --shallow \
      --no-history \
      --no_bootstrap \
      --with_branch_heads \
      --with_tags

  cd "${srcdir}/chromium"

  cp "${srcdir}/gclient_args.gni" build/config/gclient_args.gni

  build/util/lastchange.py -o build/util/LASTCHANGE
  build/util/lastchange.py -m GPU_LISTS_VERSION --revision-id-only --header gpu/config/gpu_lists_version.h
  build/util/lastchange.py -m SKIA_COMMIT_HASH -s third_party/skia --header skia/ext/skia_commit_hash.h
  build/util/lastchange.py -s third_party/dawn --revision gpu/webgpu/DAWN_VERSION

  # Use chromium-dev as brand name.
  sed -e 's|=Chromium|&-Dev|g' \
      -i chrome/app/theme/chromium/BRANDING
  sed -e '0,/output_name = "chrome"/s/= "chrome"/= "chromium-dev"/' \
      -e 's|root_out_dir/chrome"|root_out_dir/chromium-dev"|g' \
      -e 's|root_out_dir/chrome.debug"|root_out_dir/chromium-dev.debug"|g' \
      -e 's|root_out_dir/chrome.stripped"|root_out_dir/chromium-dev.stripped"|g' \
      -i chrome/BUILD.gn
  sed -e 's|"chromium-browser"|"chromium-dev"|g' \
      -e 's|"Chromium"|"Chromium-Dev"|g' \
      -i media/audio/pulse/pulse_util.cc
  sed -e 's|"Chromium|&-Dev|g' \
      -i chrome/common/chrome_constants.cc
  sed -e 's|chromium-browser|chromium-dev|g' \
      -i chrome/browser/shell_integration_linux.cc
  sed -e 's|chromium|&-dev|' \
      -i chrome/common/chrome_paths_linux.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -e 's|/usr/share/chromium|&-dev|' \
      -i chrome/common/chrome_paths.cc \
      -i chrome/browser/web_applications/preinstalled_web_apps/README.md \
      -i chrome/browser/web_applications/preinstalled_web_app_manager.cc
  sed -e 's|/etc/chromium|&-dev|' \
      -e "s|'app_name': 'Chromium|&-Dev|g" \
      -i components/policy/tools/template_writers/writer_configuration.py

  # Fix(?) the name of the sandbox.
  sed -e 's|chrome-sandbox|chrome_sandbox|g'\
      -i sandbox/linux/suid/client/setuid_sandbox_host.cc \
      -i sandbox/linux/suid/client/setuid_sandbox_host.h

  msg2 "Patching the sources"

  # Misc patches.

  # Disable swiftshader
  sed 's| target_cpu == "x64"))| target_cpu == "x64") \&\& enable_swiftshader_vulkan)|g' \
    -i BUILD.gn

  # Pats to chromium dev's about why always they forget add/remove missing build rules.
  # Not this time (?).

  # Allow building against system libraries in official builds.
  sed 's|OFFICIAL_BUILD|GOOGLE_CHROME_BUILD|' \
    -i tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950.
  sed -e 's/\<xmlMalloc\>/malloc/' \
      -e 's/\<xmlFree\>/free/' \
      -i third_party/blink/renderer/core/xml/*.cc \
      -i third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
      -i third_party/libxml/chromium/*.cc \
      -i third_party/maldoca/src/maldoca/ole/oss_utils.h

  # # Patch from Gentoo
  patch -p1 -i "${srcdir}/chromium-cross-compile.patch"
  patch -p1 -i "${srcdir}/chromium-108-EnumTable-crash.patch"
  patch -p1 -i "${srcdir}/chromium-111-InkDropHost-crash.patch"

  mkdir -p buildtools/third_party/eu-strip/bin
  ln -sf /usr/bin/true buildtools/third_party/eu-strip/bin/eu-strip

  # # Patch from crbug.com (chromium bugtracker), chromium-review.googlesource.com / Gerrit or Arch chromium package.

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -p1 -i "${srcdir}/use-oauth2-client-switches-as-default.patch"

  # Upstream fixes


  # Use the file at run time instead of effectively compiling it in.
  sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' \
    -i services/device/usb/BUILD.gn

  # Setup the linker in chromium.
  sed "s|-fuse-ld=lld|-fuse-ld=${_clang_path}${_lld}|g" \
    -i third_party/ffmpeg/chromium/scripts/build_ffmpeg.py \
    -i build/config/compiler/BUILD.gn

  # Setup bundled ffmpeg.
  # Add build verbose output.
  # setup all cores
  sed -e "s|'make', '-j|'make', $_verbose_ffmpeg '-j|g" \
      -e "s|parallel_jobs = 8|parallel_jobs = $(nproc)|g" \
      -i third_party/ffmpeg/chromium/scripts/build_ffmpeg.py
  sed -e "s|, \"src\"|, \"chromium\"|g" \
      -e 's|makeinfo|mkeinfo|g' \
      -i third_party/ffmpeg/chromium/scripts/robo_lib/config.py

  # Use system opus.
  patch -p1 -i "${srcdir}/system-opus.diff"

  # use system openh264
  if [ -d /usr/include/openh264 ]; then
    sed 's|wels/|openh264/wels/|g' \
      -i build/linux/unbundle/openh264.gn
  fi

  # Remove most bundled libraries. Some are still needed.
  msg2 "Removing unnecessary components to save disk space."
  build/linux/unbundle/remove_bundled_libraries.py ${_keeplibs[@]} --do-remove

  msg2 "Changing bundle libraries to system ones."
  build/linux/unbundle/replace_gn_files.py --system-libraries ${_use_system[@]}

  msg2 "Setup NaCl/PNaCl SDK: Download and install toolchains"
  build/download_nacl_toolchains.py --packages saigo_newlib,nacl_x86_newlib,pnacl_newlib,pnacl_translator sync --extract

  msg2 "Download prebuild clang from Google"
  tools/clang/scripts/update.py

  msg2 "Download prebuild rust from Google"
  tools/rust/update_rust.py

  msg2 "Download prebuild node,js from Google"
    # Setup nodejs dependency.
  (
  cd third_party/node
  ./update_node_binaries
  ./update_npm_deps
  )
}

build() {
  # set python for build pnacl.
  export PNACLPYTHON=/usr/bin/python

  export PATH="${_clang_path}:$PATH"

  msg2 "Build the Launcher"
  make -C chromium-launcher \
    CHROMIUM_SUFFIX="-dev"

  cd "${srcdir}/chromium"

  msg2 "Build bundled ffmpeg"
  pushd third_party/ffmpeg &> /dev/null
  # Disable lto.
  # NOTE: This avoid messages like:
  # bfd plugin: LLVM gold plugin has failed to create LTO module: Unknown attribute kind (60) (Producer: 'LLVM9.0.0svn' Reader: 'LLVM 8.0.0')
  # when you have installed clang in the system.
  # Use bundled clang
  chromium/scripts/build_ffmpeg.py linux x64 --branding ChromeOS -- \
    --enable-lto=no \
    --cc="${_clang_path}clang" \
    --cxx="${_clang_path}clang++" \
    --ld="${_clang_path}clang" \
    --ar="${_clang_path}llvm-ar" \
    --disable-doc
#     --disable-asm

  chromium/scripts/copy_config.sh
  chromium/scripts/generate_gn.py
  popd &> /dev/null

  msg2 "Starting building Chromium..."
  msg2 "Flags Active:"
  echo ${_flags[@]}
  LC_ALL=C gn gen out/Release $_verbose_output --args="${_flags[*]}" --script-executable=/usr/bin/python
  #   LC_ALL=C gn args --list out/Release && exit # DEBUG: this command list the build options. only available if configure is sucessfull

  # Build all.
  LC_ALL=C ninja -C out/Release $_verbose_output chrome chrome_sandbox chromedriver.unstripped
}

package() {
  # Install launcher.
  make -C chromium-launcher \
    PREFIX=/usr \
    CHROMIUM_SUFFIX="-dev" \
    DESTDIR="${pkgdir}" \
    install
  install -Dm644 "chromium-launcher/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE.launcher"

  pushd "chromium/out/Release" &> /dev/null

  # Install binaries.
  _bin=(
    'chromium-dev'
    'chrome_sandbox'
    'chromedriver.unstripped'
    'chrome_crashpad_handler'
  )
  for i in "${_bin[@]}"; do
    case "$i" in
      chrome_sandbox)
        install -Dm4755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
        ;;
      chromedriver.unstripped)
        install -Dm775 "${i}" "${pkgdir}/usr/lib/chromium-dev/chromedriver"
        ;;
      *)
        install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
        ;;
    esac
  done

  ln -sf /usr/lib/chromium-dev/chromedriver "${pkgdir}/usr/bin/chromedriver-dev"

  # Install libs.
  for i in lib*.so; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  local _blobs
  _blobs=(
    'snapshot_blob.bin'
    'v8_context_snapshot.bin'
    'icudtl.dat' # https://crbug.com/678661.
    'MEIPreload/manifest.json'
    'MEIPreload/preloaded_data.pb'
  )

  for i in "${_blobs[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Install NaCL.
  local _nacl_libs
  _nacl_libs=(
    'nacl_helper'
    'nacl_helper_bootstrap'
    'nacl_irt_x86_64.nexe'
  )
  for i in "${_nacl_libs[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Install Resources.
  local _resources
  _resources=(
    'chrome_100_percent.pak'
    'chrome_200_percent.pak'
    'headless_command_resources.pak'
    'headless_lib_data.pak'
    'headless_lib_strings.pak'
    'resources.pak'
  )
  for i in "${_resources[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/lib/chromium-dev/${i}"
  done

  # Set info.
  source "${srcdir}/chromium/chrome/installer/linux/common/installer.include"
  PACKAGE=chromium-dev
  PROGNAME=chromium-dev
  MENUNAME="Chromium-dev Web Browser"
  USR_BIN_SYMLINK_NAME=chromium-dev
  # Install .desktop and manpages.
  process_template "${srcdir}/chromium/chrome/app/resources/manpage.1.in" chromium-dev.1
  install -Dm644 chromium-dev.1 "${pkgdir}/usr/share/man/man1/chromium-dev.1"
  process_template "${srcdir}/chromium/chrome/installer/linux/common/desktop.template" chromium-dev.desktop
  install -Dm644 chromium-dev.desktop "${pkgdir}/usr/share/applications/chromium-dev.desktop"

  # Install locales.
  install -Dm644 locales/*.pak -t "${pkgdir}/usr/lib/chromium-dev/locales"

  # Install icons.
  for _size in 16 24 32 48 64 128 256; do
    case "${_size}" in
      16|32) local _branding="${srcdir}/chromium/chrome/app/theme/default_100_percent/chromium" ;;
      *) local _branding="${srcdir}/chromium/chrome/app/theme/chromium" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/chromium-dev.png"
  done
  install -Dm644 "${srcdir}/chromium-dev.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/chromium-dev.svg"

  popd &> /dev/null

  # Install License.
  install -Dm644 "chromium/LICENSE" "${pkgdir}/usr/share/licenses/chromium-dev/LICENSE"
}
