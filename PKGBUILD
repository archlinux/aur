# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-g-kpe
pkgver=5.1.5
pkgrel=0
pkgdesc="Customizable privacy conscious web browser with better integration with KDE and primary support for webextensions"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'ttf-font' 'hicolor-icon-theme' 'glibc' 'libpulse' 'nss' 'nspr')
makedepends=('unzip' 'zip' 'diffutils' 'yasm' 'mesa' 'imake' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'alsa-lib' 'jack' 'cbindgen' 'nasm'
             'nodejs' 'lld' 'bc' 'python' 'pciutils' 'dump_syms'
             'wasi-compiler-rt' 'wasi-libc' 'wasi-libc++' 'wasi-libc++abi'
             'git')
replaces=("waterfox-g4-kpe" "waterfox-g3-kpe")
options=('!emptydirs' '!makeflags' 'zipman' '!lto')
_filesrev=8b87af25b6c74fa1926f6fe10cb7833e720c88a5
_filesurl=https://raw.githubusercontent.com/hawkeye116477/waterfox-deb-rpm-arch-AppImage/$_filesrev/waterfox-g-kpe
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=G$pkgver"
        "waterfox-g.desktop::$_filesurl/waterfox-g.desktop"
        "distribution.ini::$_filesurl/distribution.ini"
        "vendor.js::$_filesurl/vendor.js"
        "waterfox-g.1::$_filesurl/waterfox-g.1"
        "syspref.js::$_filesurl/syspref.js"
        "waterfox-g.appdata.xml.in::$_filesurl/waterfox-g.appdata.xml.in"
        "global_menu.patch::$_filesurl/patches/global_menu.patch"
        "g-kde.patch::$_filesurl/patches/g-kde.patch"
        "fis-csd-global-menu.patch::$_filesurl/patches/fis-csd-global-menu.patch"
        "nongnome-proxies.patch::$_filesurl/patches/nongnome-proxies.patch"
        "mozilla-ntlm-full-path.patch::$_filesurl/patches/mozilla-ntlm-full-path.patch"
        "libavcodec58_91.patch::$_filesurl/patches/libavcodec58_91.patch"
        "fix-langpack-id.patch::$_filesurl/patches/fix-langpack-id.patch"
        "waterfox-branded-icons.patch::$_filesurl/patches/waterfox-branded-icons.patch"
        "fix-wayland-build.patch::$_filesurl/patches/fix-wayland-build.patch"
        "mach-depends.patch::$_filesurl/patches/mach-depends.patch"
        )
sha256sums=('SKIP'
            '09b6d083ecfc42d8c355177b56b7073f387c968c162041507f2870c38e4b7259'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            '5a3b4ebefbd9e5dd3abdc9e694ef4dadcce6fcc93f9352ee30f1fcb639a227f6'
            '22e22f4ba6e74a5f33926f4665351c80c516470ac45716c27479147484dea855'
            '0120e01edb0bf3d42f4e0280345f2c44372b097739cd2ddb85fa69bb2233ebab'
            '2d68de6cb40900f4f1aeee33b49ee602c0ba6e3758226d31032df64af728c90e'
            'b4c84d27f17426224db5a357dbc8183311101fe97a575f69cb0fef4839a936cf'
            'ec96bc6c496f076a43d1005a3d0ab7ec8a4083242daca3b129c6aad2bfc7e353'
            '6d74e7da4ade11c7e4b54a8037f3930946928e66e6a6ffb0e30180e9f1f3f364'
            '539ff4b7580762b9f2fe47a9166502b7ed4c8cc98599694bf67476606c1c90d7'
            '2bb12adfdb1e26e6dbb184cae8aeb85c83c886d9ce1f6a243b613bc192ad248f'
            '27cd1dfcc545938b16db1555eecb728bea4e4666e92c4d05ec2c16eeef5064b4'
            '443fb2d0d58d89f5bdb010183f00e1a5d6bc20e35bf3d1ad93537b7c02d471a9'
            '2bb954aaac047c53b1d7fe779c95cf533ebac1f9f3cf175cf9caec8191c94a92'
            '46724a625f51c358abaee488a7ce75673078e96ba009459339120b8dd11dec25'
            '3f4514da71b9e5f1630b8ddc37b48594203ef907c8081d3e986217666814842a')

prepare() {

  cd Waterfox

  # Add patches
  patch -Np1 -i ../global_menu.patch
  patch -Np1 -i ../g-kde.patch
  patch -Np1 -i ../fis-csd-global-menu.patch
  patch -Np1 -i ../nongnome-proxies.patch
  patch -Np1 -i ../mozilla-ntlm-full-path.patch
  patch -Np1 -i ../libavcodec58_91.patch
  patch -Np1 -i ../fix-langpack-id.patch
  patch -Np1 -i ../waterfox-branded-icons.patch
  patch -Np1 -i ../fix-wayland-build.patch
  patch -Np1 -i ../mach-depends.patch

  cat >../mozconfig <<END
ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

ac_add_options --prefix=/usr

# Libraries
ac_add_options --x-libraries=/usr/lib

# Disable unwanted features
ac_add_options --disable-updater
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-crashreporter
ac_add_options --disable-verify-mar
ac_add_options --disable-dmd
ac_add_options --disable-geckodriver
ac_add_options --disable-bootstrap
ac_add_options --disable-elf-hack
ac_add_options --disable-tests

# Enable wanted features
ac_add_options --enable-jxl
ac_add_options --enable-optimize
ac_add_options --enable-eme=widevine
ac_add_options --enable-rust-simd
ac_add_options --enable-application=browser
ac_add_options --enable-hardening
ac_add_options --enable-linker=lld
ac_add_options --enable-default-toolkit=cairo-gtk3-wayland

ac_add_options --with-app-name=waterfox-g
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=waterfox/browser/branding
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
ac_add_options --allow-addon-sideload
ac_add_options "MOZ_ALLOW_LEGACY_EXTENSIONS=1"

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss


export MOZ_REQUIRE_SIGNING=
export MOZ_INCLUDE_SOURCE_INFO=1
export MOZ_APP_REMOTINGNAME=waterfox-g

#mk_add_options MOZ_MAKE_FLAGS="-j$(($(nproc --all) / 2))"
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj
END
}

build() {
  cd Waterfox

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export LDFLAGS+=" -Wl,--no-keep-memory -Wl,--no-mmap-output-file"
  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  export WF_VERSION="G$pkgver"
  echo "$WF_VERSION" > ./browser/config/version_display.txt

  # LTO needs more open files
  ulimit -n 4096

  # Do 3-tier PGO
  echo "Building instrumented browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-profile-generate=cross
END
  ./mach build

  echo "Profiling instrumented browser..."
  ./mach package
  LLVM_PROFDATA=llvm-profdata \
    JARLOG_FILE="$PWD/jarlog" \
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./mach python build/pgo/profileserver.py

  stat -c "Profile data found (%s bytes)" merged.profdata
  test -s merged.profdata

  stat -c "Jar log found (%s bytes)" jarlog
  test -s jarlog

  echo "Removing instrumented browser..."
  ./mach clobber

  echo "Building optimized browser..."
  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross
ac_add_options --enable-profile-use=cross
ac_add_options --with-pgo-profile-path=${PWD@Q}/merged.profdata
ac_add_options --with-pgo-jarlog=${PWD@Q}/jarlog
END
  ./mach build

#   # Build langpacks
#   cat > ../mozconfig_LANG <<END
# ac_add_options --with-app-name=waterfox-g
# ac_add_options --with-app-basename=Waterfox
# ac_add_options --with-branding=waterfox/browser/branding
# mk_add_options MOZ_OBJDIR=${PWD}/../obj_LANG
# ac_add_options --prefix=/usr
# ac_add_options --with-l10n-base=${PWD}/waterfox/browser/locales
# ac_add_options --enable-linker=lld
# ac_add_options --disable-updater
# ac_add_options --disable-bootstrap
# ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot
# END

#   export JOBS=$(echo $(grep -c ^processor /proc/cpuinfo)\/2 | bc)
#   sed -r '/^(ja-JP-mac|en-US|)$/d;s/ .*$//' ../locales.shipped | cut -f1 -d":" \
#     | xargs -n 1 -P $JOBS -I {} /bin/sh -c '
#         locale=$1
#         cp ../mozconfig_LANG ${PWD}/mozconfig_$locale
#         sed -i "s|obj_LANG|obj_$locale|" ${PWD}/mozconfig_$locale
#         export MOZCONFIG=${PWD}/mozconfig_$locale
#         ./mach build config/nsinstall langpack-$locale
#         cp -L ../obj_$locale/dist/linux-*/xpi/waterfox-g-$WF_VERSION.$locale.langpack.xpi \
#             ${PWD}/langpack-$locale@l10n.waterfox.net.xpi
# ' -- {}
}

package_waterfox-g-kpe() {
  optdepends=('networkmanager: Location detection via available WiFi networks'
             'libnotify: Notification integration'
             'pulseaudio: Audio support'
             'alsa-lib: Audio support'
             'speech-dispatcher: Text-to-Speech'
             'hunspell-en_US: Spell checking, American English'
             'kwaterfoxhelper: KDE Plasma Integration')
  provides=("waterfox-g=${pkgver}")

  cd Waterfox

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip

  DESTDIR="$pkgdir" ./mach install

  _spellcheck_js="$pkgdir/usr/lib/waterfox-g/browser/defaults/preferences/spellcheck.js"
  install -Dm644 /dev/stdin "$_spellcheck_js" <<END
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  for i in 16 22 24 32 48 64 128 256; do
      install -d "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
      ln -Ts /usr/lib/waterfox-g/browser/chrome/icons/default/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-g.png"
  done
  install -Dm644 waterfox/browser/branding/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-g.png"
  install -Dm644 waterfox/browser/branding/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-g.png"

  install -Dm644 $srcdir/waterfox-g.desktop \
    "$pkgdir/usr/share/applications/waterfox-g.desktop"

  install -Dm644 $srcdir/waterfox-g.1 \
    "$pkgdir/usr/share/man/man1/waterfox-g.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-g/distribution/distribution.ini"

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/waterfox-g/browser/defaults/preferences/vendor.js"

  # Generate date and version for metadata file
  export TODAY_DATE=$(date +%Y-%m-%d)
  sed -i "s/__DATE__/$TODAY_DATE/g" ../waterfox-g.appdata.xml.in
  sed -i "s/__VERSION__/G$pkgver/g" ../waterfox-g.appdata.xml.in

  install -Dm644 $srcdir/waterfox-g.appdata.xml.in \
    "$pkgdir/usr/share/metainfo/waterfox-g.appdata.xml"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-g" <<END
#!/bin/sh
exec /usr/lib/waterfox-g/waterfox-g "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-g" \
    "$pkgdir/usr/lib/waterfox-g/waterfox-g-bin"

  # Add syspref.js for setting preferences for all users
  mkdir -p "$pkgdir/etc/waterfox-g"
  cp "$srcdir/syspref.js" "$pkgdir/etc/waterfox-g/"
  ln -Tsf /etc/waterfox-g/syspref.js "$pkgdir/usr/lib/waterfox-g/browser/defaults/preferences/syspref.js"

#   # Install langpacks
#   mkdir -p "$pkgdir/usr/lib/waterfox-g/browser/extensions/"
#   cp "${srcdir}"/waterfox-g-kpe-$pkgver/*.xpi "$pkgdir/usr/lib/waterfox-g/browser/extensions/"
}

# vim: set ts=2 sw=2 et syn=sh ft=sh:
