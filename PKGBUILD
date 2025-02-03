# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>


# For common issues regarding GCC and firefox see:
# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=45375

# enable this if you run out of memory during linking
#_lowmem=true

# build with PGO
_pgo=true

_pkgname=firefox
pkgname=$_pkgname-kde-opensuse
pkgver=134.0.2
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://github.com/openSUSE/firefox-maintenance"
depends=('libxt' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
         'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	     'sqlite' 'kmozillahelper' 'ffmpeg'
         'xdg-desktop-portal'
        )

makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake'
             'xorg-server-xvfb' 'libpulse' 'inetutils'
             'cargo' 'mercurial' 'llvm' 'clang' 'rust' 'jack'
             'nodejs' 'cbindgen' 'nasm' 'xz'
             'python' 'python-zstandard' 'dump_syms'
             # system av1
             'dav1d' 'aom'
             # system harfbuzz
             'harfbuzz'
             # system graphite
             'graphite'
             # system webp
             'libwebp'
             # system libevent
             'libevent'
             # system icu
             'icu'
             # system libvpx
             'libvpx'
             # gtk
             'gtk3'
             'libnotify'
             'libpulse'
            )
changeslog=$pkgname.changes

# https://bugs.gentoo.org/792705
# needs fixes from GCC 11.2
makedepends+=('gcc>=11.2.0')


optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'libnotify: Notification integration'
            'xdg-desktop-portal: Screensharing with Wayland')
provides=("firefox=${pkgver}")
conflicts=('firefox')
_patchrev=22b224bf3e8c1431d2d9d961ca351cf3c50fdc15
options=('!emptydirs' !lto)
source=(https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
        mozconfig
        firefox.desktop
        vendor.js
        0001-Bug-1504834-Rough-progress-patch.patch
        0002-Bug-1504834-XULText-AA-fix-BE.patch
        0003-mozilla-bmo998749.patch.patch
        0004-mozilla-libavcodec58_91.patch.patch
        0005-mozilla-silence-no-return-type.patch-to-fix-build-er.patch
        0006-Bug-531915-mozilla-bmo531915.patch.patch
        0007-imported-patch-one_swizzle_to_rule_them_all.patch.patch
        0008-imported-patch-svg-rendering.patch.patch
        0009-Bug-1792159-Add-missing-includes-to-AtomicOperations.patch
        0010-mozilla-s390-context.patch.patch
        0011-bsc-991344-Rpi3-Firefox-crashes-after-a-few-seconds-.patch
        0012-mozilla-fix-aarch64-libopus.patch.patch
        0013-Bug-634334-call-to-the-ntlm_auth-helper-fails.patch
        0014-Make-PGO-use-toolchain.patch
        0015-bmo-1516803-force-one-LTO-partition-for-sandbox-when.patch
        0016-Fix-building-with-PGO-when-using-GCC.patch
        0017-LTO-Only-enable-LTO-for-Rust-when-complete-build-use.patch
        0018-Bug-1516081-Disable-watchdog-during-FDO-train.patch
        0019-Bug-559213-Support-system-av1.patch
        0020-Bug-847568-Support-system-harfbuzz.patch
        0021-Bug-847568-Support-system-graphite2.patch
        0022-Bug-1611386-Reenable-support-for-enable-system-sqlit.patch
        0023-Do-not-use-gconf-for-proxy-settings-if-not-running-w.patch
        0024-Add-KDE-integration-to-Firefox.patch
        0025-Imported-patch-firefox-branded-icons.patch.patch
        0026-Allow-Eme-for-arm-and-Aarch64.patch
        0027-Shut-up-warnings-about-future-Rust-version-incompati.patch
        0028-Bug-1796523-Workaround-source-locations-for-function.patch
        0029-Bug-1822730-Add-basic-blob-protocol-handling-for-blo.patch
        0030-Map-linearly-from-cubeb-volume-to-pa-volume.patch
       )

sha256sums=('6c6eb7ff13fa689c5cace23a28533361d1ca29158329b6f1c2f2d1c91c53dd27'
            'SKIP'
            'db4650fb8ef2702f14b5075958b9212d6c74a1809a5ccf34de03281738a01b94'
            '4c93b2e1f1675e033ed7910fe5f379626a92903a940697430985bcfdf94afceb'
            '43553191c37362fc131a84326487ec4a91794b86f7eda0152c47025f73eabd29'
            '5d7d15a059bbe6946a1f722b33738d9c21f5d0b23046342a20dabb01af2f81b0'
            '160a30005fc1ed97be5a7ed58297be7bc14f61aad74a7c84624428ff7c5b1bc5'
            '4322124dc370ac56063837370a8107e85ca6e0d4037ff71ece5e7b0f55ed8053'
            'a97ca0d331bff6d3e8f01ec7bd2826daa617d3ae2da5bf5263e2fdbebb1d235a'
            '196f23157460428657c5d3dbed2c3ed2ce7fd324aa9b4197ab28b29cacdc3c3d'
            '9014c66f6e8b1166ab06d9ffdeeb1e4e40efa6b9ade6aadaa5743024d5f23fbd'
            'bba76c5e13952ef45362f8e53a5c030e0f5d722f8f266228787136a5312330ea'
            '07d7d8f19addf9034d997413ef783b604e475f307ac5de08e1e77b8126535ee1'
            '766faefbd4898049e9913589962bf839da6785d50f0631b4eac7316f16bf2ea6'
            '304a21cb07d3fa185580bf9f923a98ec3d405174d00ffa7362e1368bed1d0584'
            '8e81ce52a2b0629693dce6924ea32ee10ac81598afd333667df51e6aa4d3864f'
            '6145dc18238fca575dbbe65a3c244984cb132c0a08a02520af036bf77144b7c1'
            'a08d509648e15f174e69f5073a87b12ff5430171f34ed54ac70eee3cae1cd75b'
            '3144c2f38c9e60ba00f231e7a8051ca41cdc5d9f542c0144f4549f525a8c129f'
            'eff8c7538751a35acf3ce60f5ef6cce5d8da99ac06f1086753a805e6e8440235'
            '759bcfdda76b765614ff77e5259d802e3578378a1ecb80e968b8948a4633ee31'
            'b594db8d8fc3f2a8a2e67fa011932064efad027768263139dcc773b02d91696e'
            '49a2cffcbf7abee4ae940d0b0b5d78ab4af765095f255d3d42e5cb5ea68a07d6'
            '1bc8daf767c49d73566498d391fa3b16b05ebb008b5620f6501cb54e8bf4bdfd'
            'a8316d9fd785c5d84785a78ddfda6b69962c2dc0e7cd14f726a8bf8a8ca79b99'
            '08a121e861a3a9ed3056650adc390de95c2aa019e7e1652a239fe6786a25046d'
            '3e406c8eb34a4fd164b8ba0e2381d0a884169287baf8a4048ba1e1deb546d744'
            'a983f79d0a9c8b17ce3271250dd61e49a2ea9e70bf526f4f586fb5e17c01fcba'
            'e09c15db2613098b72c67d0b1cb39dc987837df79b42cac38546abd1a24753f4'
            'b2f67153b109e6840e82be43793508593a59670d752eed6b61cf4880d27e7389'
            'ebabeddc6d27b0e78c0c5d8d9a80e86dfff4c7fd75b6e67cb9a400eea556b9b9'
            'd024bf47ce077bb7f3fc2fa8665c768151a523b3a5a15d744442b9e7a3b02912'
            '9da3be5af85c6f65f19678624a6397615ec185cba3465b5704843aaf901a0293'
            'c04680b4cf59cc393ceb9d1c771b929899074d7f7fd5f232aea201f0630da977'
            'de9756a15da4222150908895ae634897c06ec8ca00bdaf7e668f474caefd2ccc')

validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)


# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4


# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

prepare() {
  cd firefox-$pkgver

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-location-service-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-safebrowsing-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  for patch in "$srcdir"/*.patch ; do
    echo "Applying $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  #export CXXFLAGS="${CFLAGS}"
  cd firefox-$pkgver
  export MOZ_SOURCE_REPO="$_repo"
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_APP_REMOTINGNAME=$pkgname
  export CARGO_HOME="$srcdir"/.cargo
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=system

  # LTO needs more open files
  ulimit -n 4096

  export CC=gcc
  export CXX=g++
  export AR="gcc-ar"
  export NM="gcc-nm"
  export RANLIB="gcc-ranlib"

  export MOZ_MAKE_FLAGS="$MAKEFLAGS"
  export MOZ_SMP_FLAGS="$MAKEFLAGS"
  export STRIP=/bin/true

  if [[ -n $_lowmem || $CARCH == i686 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  if [[ -n $_pgo ]]; then
    export DISPLAY=:99
    export MOZ_PGO=1

    export TMPDIR="$srcdir/tmp"
    mkdir -p "$TMPDIR"

    xvfb-run \
      -a \
      -s "-extension GLX -screen 0 1280x1024x24" \
      ./mach build
  else
    ./mach build
  fi
  ./mach buildsymbols
}

package() {
  # The .so dependencies have to be added here so
  # pacman doesn't try to install the build time  dependencies
  # by trying to resolve so names.
  # Doing so makes pacman ask for which have to be installed even thou
  # they are already specificied in makedepends
  depends+=(
    # system av1
    'libdav1d.so' 'libaom.so'
    # system harfbuzz
    'libharfbuzz.so'
    # system icu
    'libicuuc.so'
    'libicui18n.so'
    # system vpx
    'libvpx.so'
    # gtk
    'libgtk-3.so'
  )
  cd firefox-$pkgver

  [[ "$CARCH" == "i686" ]] && cp "$srcdir/kde.js" obj-i686-pc-linux-gnu/dist/bin/defaults/pref
  [[ "$CARCH" == "x86_64" ]] && cp "$srcdir/kde.js" obj-x86_64-pc-linux-gnu/dist/bin/defaults/pref

  DESTDIR="$pkgdir" ./mach install

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"
  install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/kde.js"

  _distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/official/default$i.png \
            "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  install -Dm644 browser/branding/official/content/about-logo.png \
          "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
          "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/$pkgname.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

}
