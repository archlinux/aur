# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-ozone
pkgver=76.0.3809.100
pkgrel=2
_launcher_ver=6
_meta_browser_sha=38b36f421f8d984c7004c9d9a6d514ed2fb6cf8e
pkgdesc="Chromium built with patches for wayland support via Ozone"
arch=('x86_64')
url="https://www.chromium.org/Home"
options=(debug !strip)
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'desktop-file-utils' 'hicolor-icon-theme')
provides=('chromium')
conflicts=('chromium')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git'
             'clang' 'lld' 'gn<0.1578.0' 'java-runtime-headless')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        meta-browser-${_meta_browser_sha}.tar.gz::https://github.com/OSSystems/meta-browser/archive/${_meta_browser_sha}.tar.gz
        chromium-system-icu.patch
        chromium-widevine.patch
        chromium-skia-harmony.patch
        0001-ozone-wayland-Prepare-WaylandCanvasSurface-for-compl.patch
        0002-ozone-wayland-Sway-avoid-sending-presentation-early.patch
        0003-Ozone-Wayland-Manager-make-mojo-calls-on-IO-thread.patch
        0004-ozone-wayland-Fix-broken-software-rendering-path.patch
        0005-ozone-wayland-Use-mutex-before-accessing-surfaces-ma.patch
        0006-ozone-wayland-Reset-surface-contents-in-a-safe-way.patch
        0007-ozone-wayland-Stop-using-wl_display_roundtrip.patch
        0008-ozone-wayland-Added-HiDPI-support-for-Ozone-Wayland.patch
        0009-Fixed-positioning-and-sizes-of-menus-when-the-scale-.patch
        0010-ozone-wayland-Extract-window-management-methods-to-o.patch
        0011-ozone-wayland-Do-not-use-possibly-blocking-dispatch-.patch)
sha256sums=('8cd93ada3e0837ced512f69783400991d3b82e0d9622e04fab5922877577d26d'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            'd87957d01be9fb59faf5fde523eb87a8256605b1533171416b7a56bfcbd6d056'
            'e2d284311f49c529ea45083438a768db390bde52949995534034d2a814beab89'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '1fe3bb02ffd0445da8ea3b9eb09e8dff6b7bdd1ca26f4b439310a3e94aa16ebf'
            'd9c5932f1af91a8c2e8b7687d9ad013d5895e3e03811d9f03e674afb77031ce5'
            '424c5c0e5b6ded87d0c00dd4755eb6e63bfdf42233ee60c354729f5cbba82334'
            'fecdfa694a84b4dc688ec20970ea18b11d9e332b8423a935ba35cd3fae7485a5'
            '2359fdd84a3c10eeb576b15cfea86a34867097cb3e3d30ade6c823cf0d538d99'
            '13be86e54b14f5a9f21e371a0f2762c5ff9a4204877ded60600f5950f6a14885'
            'ede2a4c0283f01f7653c0caabd8439d96c27da16dd557ebb0730c0b3e7134097'
            '9996ddaa8a83c58dcbe45e21746ffe41a9f8b56edc71a16090ebdb6adbc74541'
            '6f4fc0a82443f9bfaeecfd1a463b4bc10dfa29b9357f17592dfac8332d27cb3c'
            '470cf88aa6878bfaaf74f00791d33f4f922f31a13e0503b8bb11edb4bb89d29c'
            'aaefa3a868024aa1eb118236bd528986db972646f762418764b5f0ab326468b0')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  [libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  ${!_system_libs[@]}
  ${_system_libs[libjpeg]+libjpeg_turbo}
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

_mb_general_patches=(
  'oe-clang-fixes.patch'
  # 'v8-qemu-wrapper.patch'
  'wrapper-extra-flags.patch'
  'do-not-specify-march-on-arm.patch'
  'add_internal_define_armv7ve.patch'
)

_mb_wayland_patches=(
  '0001-ozone-wayland-Fix-method-prototype-match.patch'
  'V4L2/0001-Add-support-for-V4L2VDA-on-Linux.patch'
  'V4L2/0002-Add-mmap-via-libv4l-to-generic_v4l2_device.patch'
)

_bugfix_patches=(
  '0001-ozone-wayland-Prepare-WaylandCanvasSurface-for-compl.patch'
  '0002-ozone-wayland-Sway-avoid-sending-presentation-early.patch'
  '0003-Ozone-Wayland-Manager-make-mojo-calls-on-IO-thread.patch'
  '0004-ozone-wayland-Fix-broken-software-rendering-path.patch'
  '0005-ozone-wayland-Use-mutex-before-accessing-surfaces-ma.patch'
  '0006-ozone-wayland-Reset-surface-contents-in-a-safe-way.patch'
  '0007-ozone-wayland-Stop-using-wl_display_roundtrip.patch'
  '0008-ozone-wayland-Added-HiDPI-support-for-Ozone-Wayland.patch'
  '0009-Fixed-positioning-and-sizes-of-menus-when-the-scale-.patch'
  '0010-ozone-wayland-Extract-window-management-methods-to-o.patch'
  '0011-ozone-wayland-Do-not-use-possibly-blocking-dispatch-.patch'
)

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/libxml_utils.cc

  # Load Widevine CDM if available
  patch -Np1 -i ../chromium-widevine.patch

  # https://crbug.com/skia/6663#c10
  patch -Np0 -i ../chromium-skia-harmony.patch

  # https://bugs.gentoo.org/661880#c21
  patch -Np1 -i ../chromium-system-icu.patch

  # chromium-ozone-wayland
  for PATCH in ${_mb_general_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/meta-browser-${_meta_browser_sha}/recipes-browser/chromium/files/${PATCH}
  done

  for PATCH in ${_mb_wayland_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/meta-browser-${_meta_browser_sha}/recipes-browser/chromium/chromium-ozone-wayland/${PATCH}
  done

  for PATCH in ${_bugfix_patches[@]}
  do
    echo "Applying $PATCH"
    patch -Np1 -i $srcdir/${PATCH}
  done

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path 'third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  python2 tools/clang/scripts/update.py
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  local _flags=(
    'is_official_build=true' # implies is_cfi=true on x86_64
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'use_ozone=true'
    'ozone_platform_wayland=true'
    'ozone_auto_platforms=false'
    'use_xkbcommon=true'
    'use_system_libwayland=true'
    'use_system_minigbm=true'
    'use_system_libdrm=true'
    'use_vaapi=false'
    'use_jumbo_build=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
  )

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
    _flags+=('cc_wrapper="ccache"')
  fi

  if check_option strip y; then
    _flags+=('symbol_level=0')
  else
    _flags+=('symbol_level=1')
  fi

  gn gen out/Release --args="${_flags[*]}" --script-executable=/usr/bin/python2
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e "s/@@MENUNAME@@/Chromium/g" \
    -e "s/@@PACKAGE@@/chromium/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/chromium/g" \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  cp \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
