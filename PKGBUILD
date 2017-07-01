# Maintainer: Michael Egger <gcarq@archlinux.info>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

#########################
## -- Build options -- ##
#########################

_enable_vaapi=0  # VA-API hardware video acceleration, might be problematic with AMD and NVIDIA

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg     # https://crbug.com/731766
  [flac]=flac
  [harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu           # Enable again when upstream supports ICU 59
  [libdrm]=
  [libjpeg]=libjpeg
  [libpng]=libpng
  #[libvpx]=libvpx     # https://bugs.gentoo.org/show_bug.cgi?id=611394
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)

pkgname=inox
pkgver=59.0.3071.115
pkgrel=1
_launcher_ver=5
_freetype_rev=5a3490e054bda8a318ebde482
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google"
arch=('i686' 'x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'desktop-file-utils'
         'hicolor-icon-theme')
depends+=(${_system_libs[@]})
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
install=inox.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium-freetype2::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2#commit=$_freetype_rev
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/inox.desktop
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-system-ffmpeg-r6.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0001-ClientNativePixmapFactoryDmabuf-uses-ioctl-instead-o.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0001-Fix-kernel-version-condition-for-including-dma-buf.h.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0001-Clip-FreeType-glyph-bitmap-to-mask.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-blink-gcc7.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-v8-gcc7.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-widevine.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/vaapi_patch_r2.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0019-disable-battery-status-service.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0003-disable-autofill-download-manager.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0004-disable-google-url-tracker.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0005-disable-default-extensions.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0006-modify-default-prefs.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0007-disable-web-resource-service.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0008-restore-classic-ntp.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0009-disable-google-ipv6-probes.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0010-disable-gcm-status-check.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0011-add-duckduckgo-search-engine.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0012-branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0020-launcher-branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0013-disable-missing-key-warning.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0014-disable-translation-lang-fetch.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0015-disable-update-pings.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0016-chromium-sandbox-pie.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0017-disable-new-avatar-menu.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0018-disable-first-run-behaviour.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0001-fix-building-without-safebrowsing.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/product_logo_{16,22,24,32,48,64,128,256}.png)

sha256sums=('37cbc9955ae3b25cd4e9851a82ea97a0035021cc90658902938ad1c20f263170'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            'SKIP'
            'ff3f939a8757f482c1c5ba35c2c0f01ee80e2a2273c16238370081564350b148'
            '2fc21f48b95f9f2c2bd8576742fcf8028a8877c6b6e96c04d88184915982234e'
            '9c081c84a4f85dbef82a9edf34cf0b1e8377c563874fd9c1b4efddf1476748f9'
            '42eb6ada30d5d507f2bda2d2caece37e397e7086bc0d430db776fad143562fb6'
            'e60aa0ff01f8bee67e45fde7bbe932901194984673ec4b10ea82bba1bace0cd7'
            'f94310a7ba9b8b777adfb4442bcc0a8f0a3d549b2cf4a156066f8e2e28e2f323'
            '46dacc4fa52652b7d99b8996d6a97e5e3bac586f879aefb9fb95020d2c4e5aec'
            'd6fdcb922e5a7fbe15759d39ccc8ea4225821c44d98054ce0f23f9d1f00c9808'
            'dadf3abff7818792e7fca99531b99089e1dedec2f4dd9cc92886b28ad3b1ec2a'
            '161ef7eb0ac6411cd83073a40ff037a37b206eecd3f5303a1b9b74768c5bf6c1'
            '293c31dc7df13bdef6087f839071c00dc096bfc93ffbce8615c2d157f0675033'
            'a9134b55d5521907f127e8e4e81e91a35226d55e9f034e7d589b357cf2566760'
            '55e1a5965e5fba91d591355fac9cf879769aada8a3b3e92d19185c5a6a429341'
            '09393444a9c95a1f7f271bcc4876283fa75ff9660ff50c1db7c83f7addd8f1bc'
            'dcc54ea1548c75c3f054a37d123fdd5db75379ab94de908368a589c267e65dbe'
            '2a6e7853e40c0d71d38aea7b70032e538569e576de7896d722048c4ef5a758b2'
            '562eea848542f76537a9f3993bac397b523d0ce419416daf0bb4dd17f5203c7c'
            'f294fb136ab128d8b5dc866a858d061ff2a1aea593c4081ed7a5fdb0e85553bc'
            'e8a6893c82579f71095d8bb3808a24e39b17c97efc45d2fa783072c7a0a1f9d5'
            'c5a36918c490ba5dbe4c62ff04fd17075ec0aa998465cfe261f6d931fe0e8f75'
            'bfa530d317a5de1d038fd63f16a23694abc7a953456b30ae57ac649676137a2a'
            '55b75daf5aad2a8929c80837f986d4474993f781c0ffa4169e38483b0af6e385'
            '0f29fb266fddc5b553a8eca37ad3171ef2369af77e1e3a4638d396479428c184'
            'd47347bcaeeb59e336fcaf4f2fd3a7c6950c01958cce29e969721069aa5276ad'
            '6d1d6d801cf80c1df2b4ce5f0d6a25190f4117d581ef7ba0e25a99ec765ecdd7'
            '888902c17b7de23eb6c979af2a262f7552c197fd96feb0e7e23e9160fc877741'
            'ef93487636bb3171f1f0325a24295142dd6c58937d4e916f6e5a20470ea4d3c7'
            'b98b0770c4bac1b9503cecf7759c3acead31c23293a3c60532c036b0dc285990'
            '71471fa4690894420f9e04a2e9a622af620d92ac2714a35f9a4c4e90fa3968dd'
            '4a533acefbbc1567b0d74a1c0903e9179b8c59c1beabe748850795815366e509'
            '7b88830c5e0e9819f514ad68aae885d427541a907e25607e47dee1b0f38975fd'
            '8c10e3b03b13555b461add586422472e0a96d3af49a078d6d952bc0719ba9d94'
            'cc08b771d83b7434c3173c27419bc7d1d4ee375256f3169ef2b9333ba1f2beeb'
            '53a1e8da18069eb4d6ab3af9c923c22a0f020241a4839c3140e3601052ddf6ff'
            '896993987d4ef9f0ac7db454f288117316c2c80ed0b6764019afd760db222dad'
            '3df9b3bbdc07fde63d9e400954dcc6ab6e0e5454f0ef6447570eef0549337354')

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # https://groups.google.com/a/chromium.org/d/msg/chromium-packagers/wuInaKJkosg/kMfIV_7wDgAJ
  mv "$srcdir/chromium-freetype2" third_party/freetype/src

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # https://bugs.chromium.org/p/chromium/issues/detail?id=707604
  patch -Np1 -i ../0001-ClientNativePixmapFactoryDmabuf-uses-ioctl-instead-o.patch
  patch -Np1 -i ../0001-Fix-kernel-version-condition-for-including-dma-buf.h.patch

  # https://bugs.chromium.org/p/skia/issues/detail?id=6663
  patch -Np1 -d third_party/skia <../0001-Clip-FreeType-glyph-bitmap-to-mask.patch

  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=853347
  patch -Np1 -i ../chromium-blink-gcc7.patch

  # https://bugs.chromium.org/p/chromium/issues/detail?id=614289
  patch -Np1 -i ../chromium-v8-gcc7.patch

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-system-ffmpeg-r6.patch

  # Misc Patches:
  if [ "${_enable_vaapi}" = 1 ]; then
    patch -p1 -i "${srcdir}/vaapi_patch_r2.patch"
  fi

  # Fix paths.
  sed -e 's|i386-linux-gnu/||g' \
      -e 's|x86_64-linux-gnu/||g' \
      -e 's|/usr/lib/va/drivers|/usr/lib/dri|g' \
      -e 's|/usr/lib64/va/drivers|/usr/lib/dri|g' \
      -i content/common/sandbox_linux/bpf_gpu_policy_linux.cc

  # Make it possible to remove third_party/adobe
  echo > "flapper_version.h"

  # Apply patches to fix building
  patch -Np1 -i ../0001-fix-building-without-safebrowsing.patch

  # Apply Inox patches
  patch -Np1 -i ../0003-disable-autofill-download-manager.patch
  patch -Np1 -i ../0004-disable-google-url-tracker.patch
  patch -Np1 -i ../0005-disable-default-extensions.patch
  patch -Np1 -i ../0006-modify-default-prefs.patch
  patch -Np1 -i ../0007-disable-web-resource-service.patch
  patch -Np1 -i ../0008-restore-classic-ntp.patch
  patch -Np1 -i ../0009-disable-google-ipv6-probes.patch
  patch -Np1 -i ../0010-disable-gcm-status-check.patch
  patch -Np1 -i ../0011-add-duckduckgo-search-engine.patch
  patch -Np1 -i ../0012-branding.patch
  patch -Np1 -i ../0013-disable-missing-key-warning.patch
  patch -Np1 -i ../0014-disable-translation-lang-fetch.patch
  patch -Np1 -i ../0015-disable-update-pings.patch
  patch -Np1 -i ../0016-chromium-sandbox-pie.patch
  patch -Np1 -i ../0017-disable-new-avatar-menu.patch
  patch -Np1 -i ../0018-disable-first-run-behaviour.patch
  patch -Np1 -i ../0019-disable-battery-status-service.patch

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir -p "$srcdir/python2-path"
  ln -sf /usr/bin/python2 "$srcdir/python2-path/python"

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${!_system_libs[@]} ${_system_libs[libjpeg]+libjpeg_turbo}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -path "*base/third_party/icu/*" \
      \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  # Patch Inox launcher
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  patch -Np1 -i ../0020-launcher-branding.patch
}

build() {
  make -C "chromium-launcher-$_launcher_ver"

  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"
  export TMPDIR="$srcdir/temp"
  mkdir -p "$TMPDIR"

  local _flags=(
    'is_clang=false'
    'clang_use_chrome_plugins=false'
    'symbol_level=0'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'linux_use_bundled_binutils=false'
    'use_gtk3=true'
    'use_gconf=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_sysroot=false'
    'enable_hangout_services_extension=false'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    'enable_nacl_nonsfi=false'
    'enable_rlz=false'
    'enable_rlz_support=false'
    'enable_remoting=false'
    'enable_google_now=false'
    'safe_browsing_mode=0'
    'enable_hotwording=false'
    'enable_print_preview=false'
    )
  python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${_flags[*]}"
  out/Release/gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

  ninja -C out/Release chrome chrome_sandbox chromedriver widevinecdmadapter
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pkgname/$pkgname"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/$pkgname/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/$pkgname/inoxdriver"

  cp -a \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,libwidevinecdmadapter.so} \
    out/Release/icudtl.dat \
    out/Release/locales "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  ln -s /usr/lib/$pkgname/inoxdriver "$pkgdir/usr/bin/inoxdriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
