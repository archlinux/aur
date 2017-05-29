# Maintainer: André Silva <emulatorman@riseup.net>
# Contributor: Márcio Silva <coadde@riseup.net>
# Contributor (ConnochaetOS): Henry Jensen <hjensen@connochaetos.org>
# Contributor (Parabola): Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor (Parabola): fauno <fauno@kiwwwi.com.ar>
# Contributor (Parabola): vando <facundo@esdebian.org>
# Contributor (Arch): Jakub Schmidtke <sjakub@gmail.com>
# Contributor (Parabola): Figue <ffigue at gmail>
# Contributor (Parabola): taro-k <taro-k@movasense_com>
# Contributor (Parabola): Michał Masłowski <mtjm@mtjm.eu>
# Contributor (Parabola): Luke R. <g4jc@openmailbox.org>
# Contributor (Parabola): Isaac David <isacdaavid@isacdaavid.info>
# Thank you very much to the older contributors:
# Contributor (Parabola): evr <evanroman at gmail>
# Contributor (Parabola): Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>

_pgo=false

# We're getting this from Debian Sid
_debname=firefox
_brandingver=53.0
_brandingrel=1
_debver=53.0
_debrel=deb1
_debrepo=http://ftp.debian.org/debian/pool/main/
_coadderepo=https://github.com/coadde/iceweasel/raw/master/tarballs
debfile() { echo $@|sed -r 's@(.).*@\1/&/&@'; }

_pkgname=firefox
pkgname=iceweasel
epoch=1
pkgver=$_debver.$_debrel
pkgrel=6
pkgdesc="A libre version of Debian Iceweasel, the standalone web browser based on Mozilla Firefox."
arch=(i686 x86_64 armv7h)
license=(MPL GPL LGPL)
depends=(alsa-lib dbus-glib ffmpeg gtk2 gtk3 hunspell icu=59.1 libevent libvpx libxt mime-types mozilla-common nss sqlite startup-notification ttf-font)
makedepends=(autoconf2.13 diffutils gconf imagemagick imake inetutils libidl2 libpulse librsvg-stable libxslt mesa mozilla-searchplugins pkg-config python2 quilt unzip yasm zip)
makedepends_i686=(cargo)
makedepends_x86_64=("${makedepends_i686[@]}")
options=(!emptydirs !makeflags !strip debug)
if $_pgo; then
  makedepends+=(xorg-server-xvfb)
  options+=(!ccache)
fi
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
url="https://wiki.parabola.nu/$pkgname"
source=("$_debrepo/`debfile $_debname`_$_debver.is.$_debver.orig.tar.xz"
        "$_debrepo/`debfile $_debname`_$_debver.is.$_debver-${_debrel#deb}.debian.tar.xz"
        "$_coadderepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz"
        "$_coadderepo/${pkgname}_$_brandingver-$_brandingrel.branding.tar.xz.sig"
        mozconfig
        libre.patch
        remove-default-and-shell-icons-in-packaging-manifest.patch
        gnu_headshadow.png
        drm-free.png
        $pkgname.desktop
        $pkgname-install-dir.patch
        vendor.js
        0001-Bug-1338655-Don-t-try-to-build-mp4parse-bindings.-r-.patch
        fix-wifi-scanner.diff
        enable-object-directory-paths.patch
        mozilla-1335250.patch
        $pkgname-disabled-components.patch)
sha512sums=('54bdb53f65c10e43db5df12aaf1302926e2b66997c0aeeeac0834a0943ca244ec9d847900e90fd75bee4474b97988cb87d0b51e745299db8160a22ca45ffedc6'
            'ba68ee4c2846d52d7d223d57c815db0b81e41f2e1c1f3cb3b6f74fd523826be8848f630f53179b9d5d7eb1b312a07bcd3d3df7d2c462bb85d4cb31c60182be0a'
            '08d5980b532cdbef651355baf5e971df6d641e5b6a74fd2ad4f84837b00f2fa0732069af74c76cd635cf9437fd139b8572ff7b0c86911be7c8a251b4f57a2a25'
            'SKIP'
            '510f8f2d6fdc1d457f450dd59226d6212ca170f2cc7f068960d8353ec3ad994056d19ffbe55fd2a9aa642e72c2ca08eeff45084c6fd2d4a3b3b2fd0b6d34ba04'
            '8ec7ec087b72d8f8de6d8dd8fb2f6e361e47141814e632e05d6277a67701be00aeae054cea2d2ddabfc149f12230296f0085f17bc83ba35a880b7be300a75ccd'
            '6b76f61db3036d15aacac4af767814665398243a2ad55cc11c4d58e3f2ce1740c5c4706559b919f823405f69aa89d92486ed94e0caca72b52abb703f68f5b43a'
            '76ac01f250975688439a31206f60d3ee05aa74a9cff7922ba9eab3fb3906bba176bab6dcff1791c19ca6acffed5167af841ab077d49ba1889020e5f827d34a60'
            'ac68873be1c76fd166f7a26fd2475540065b9b2d841185a346cbe3bd92645904f35f1c2a4ffc9153b638aaa419182ad2a7dea7efde91267d9eee38a312dce0cb'
            '90bf76e04036fd8b3a496802ea291c30345b9133026ab931690084c1bbb8eb0eb7ffc5b388f84144933db3c751f3593e5a566696e6a6de2c40da87af4d7f7bad'
            'cddffc04032686644b61509ea696cd36333327015e3a52f99afd23c74f18d82bec34619759f7acb053e10a7288d2d658d87350f5b4fc9e56ff2337c38aa4b5c6'
            'bac731584c3615073904b2cf0a643678458344aa6f2d82dab86226b0e443a55a391d4927f220ba566c6bcf5bb3affab05c220db3b63b7575e7ba86a67d4f9464'
            '9a02d89603ad2928e38d7350d5d71ec904815958c65cc13323f5d4cd9392b823264fae812ea658d83728839372b412fd185653ef65b7ab8dd0595158b3bdc2e2'
            '1bd2804bea1fe8c85b602f8c5f8777f4ba470c9e767ad284cb3d0287c6d6e1b126e760738d7c671f38933ee3ec6b8931186df8e978995b5109797ae86dfdd85a'
            'f60f59b5d11b9ce5ad4c01eedae78f27131f17b07720e5ac35441d43e95987d81b9b2680e7258d73b1a8092fe3ae554072d07a41d6b337af82742886196bc375'
            '3ea15f1c2e0146388687cfbb100e5d8c553fa4276c9c2c61eaccb4fe88e4dbd6697f6266eb0255546997997ca34085d0cf211701fa63d8ab2df94f5291131d7e'
            '504a5f1e1fbb9fb0a210052946e2057018a093dda48e5a0f4ca032793ab0c310b6560426c8061fc7fb9056d8a1c87c4cb0b036f769f1803c4f167df80cb2e5e2')
validpgpkeys=(
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

prepare() {
  cd "$srcdir/$_pkgname-$_debver"
  mv "$srcdir/debian" .
  mv "$srcdir/$pkgname-$_brandingver/branding" debian
  mv "$srcdir/$pkgname-$_brandingver/patches/iceweasel-branding" debian/patches
  cat "$srcdir/$pkgname-$_brandingver/patches/series" >> debian/patches/series

  export QUILT_PATCHES=debian/patches
  export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
  export QUILT_DIFF_ARGS='--no-timestamps'

  quilt push -av

  # Put gnu_headshadow.png and drm-free.png in the source code
  install -m644 "$srcdir/"{gnu_headshadow,drm-free}.png \
    browser/base/content/abouthome

  # Useless since we are doing it ourselves
  patch -Np1 -i "$srcdir/remove-default-and-shell-icons-in-packaging-manifest.patch"

  # Enable object directory paths for Iceweasel rebranding
  patch -Np1 -i "$srcdir/enable-object-directory-paths.patch"

  # Install to /usr/lib/iceweasel
  patch -Np1 -i "$srcdir/$pkgname-install-dir.patch"

  # Patch and remove anything that's left
  patch -Np1 -i "$srcdir/libre.patch"
  sed -i 's|Adobe Flash|SWF Player|g;
         ' browser/base/content/pageinfo/permissions.js \
           browser/base/content/browser-plugins.js
  sed -i '\|["]displayName["][:] ["]Flash["]| s|Flash|SWF Player|
          \|["]displayName["][:] ["]Shockwave["]| s|Shockwave|DCR Player|
          \|["]displayName["][:] ["]QuickTime["]| s|QuickTime|MOV Player|
          \|installLinux| s|true|false|
         ' browser/base/content/browser-plugins.js

  # Load our build config, disable SafeSearch
  cp "$srcdir/mozconfig" .mozconfig

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../fix-wifi-scanner.diff

  # https://bugs.archlinux.org/task/53890
  patch -Np1 -i ../0001-Bug-1338655-Don-t-try-to-build-mp4parse-bindings.-r-.patch

  mkdir "$srcdir/path"
  ln -s /usr/bin/python2 "$srcdir/path/python"

  # Load our searchplugins
  rm -rv browser/locales/searchplugins
  cp -av /usr/lib/mozilla/searchplugins browser/locales

  # Disable various components at the source level
#  patch -Np1 -i "$srcdir/${pkgname%-*}-disabled-components.patch"
#  sed -i 's|1|0|' toolkit/components/telemetry/TelemetryStartup.manifest || die "failed break telemetry startup"
#  sed -i 's|1|0|' toolkit/components/remotebrowserutils/remotebrowserutils.manifest || die "failed break remotebrowsing at startup"
#  sed -i 's|1|0|' toolkit/components/captivedetect/CaptivePortalDetectComponents.manifest || die "failed to break captiveportaldetection at startup"
#  sed -i 's|1|0|' toolkit/components/terminator/terminator.manifest || die "failed to break terminator at startup"
#  sed -i 's|1|0|' toolkit/components/securityreporter/SecurityReporter.manifest || die "failed to break securityReporter"
#  sed -i 's|1|0|' toolkit/components/crashes/CrashService.manifest || die "failed to break CrashService"
#  sed -i 's|1|0|' toolkit/components/crashmonitor/crashmonitor.manifest || die "failed to break CrashMonitor"
#  sed -i '/gmp-clearkey/d' toolkit/toolkit.mozbuild || die "failed to remove ClearKey DRM"
#  sed -i 's|1|0|' browser/experiments/Experiments.manifest || die "failed to break ExperimentsService"
#  #echo "" > dom/flyweb/moz.build || die "failed to break FlyWeb"
#  echo "" > toolkit/crashreporter/moz.build || die "Failed to dsiable CrashReporter"
#  echo "Disabling intrusive Balrog backdoor... please wait."
#  echo "" > testing/moz.build || die "failed to disable testing directory (contains Balrog/WebRTC/etc)"
#  grep -rl "aus4.mozilla.org"  | xargs sed -i 's/aus4.mozilla.org/0.0.0.0/' || die "Failed to delete aus4 Barlog servers"
#  grep -rl "aus5.mozilla.org"  | xargs sed -i 's/aus5.mozilla.org/0.0.0.0/' || die "Failed to delete aus5 Barlog servers"
#  echo "" > browser/extensions/moz.build || die "failed to disable bundled extensions"
#  echo "" > browser/app/blocklist.xml || die "failed to clear pre-loaded blocklist"
#  echo "" > services/cloudsync/moz.build || die "failed to disable CloudSync"
#  echo "" > services/fxaccounts/moz.build || die "failed to disable FxAccounts"
#  echo "" > modules/libmar/moz.build || die "failed to disable libmar (custom file format used for unattended mozilla updates)"
#  echo "" > netwerk/wifi/moz.build || die "failed to disable wifi"
#  echo "" > media/sphinxbase/moz.build || die "failed to disable SphinxBase voice recognition"
#  echo "" > media/pocketsphinx/moz.build || die "failed to disable PocketSpinx voice recognition"
#  #echo "" > b2g/moz.build || die "failed to disable B2G"
#  echo "origin	install	1	https://addons.mozilla.org" > browser/app/permissions  || die "failed disable remote login whitelist"

  # ARM-specific changes:
  if [[ "$CARCH" == arm* ]]; then
      echo "ac_add_options --disable-ion" >> .mozconfig
      echo "ac_add_options --disable-elf-hack" >> .mozconfig
      echo "ac_add_options --disable-webrtc" >> .mozconfig
      echo "ac_add_options --disable-rust" >> .mozconfig
      sed -i '/ac_add_options --enable-pie/d' .mozconfig

      # Disable gold linker, reduce memory consumption at link time
      sed -i '/ac_add_options --enable-gold/d' .mozconfig
      echo 'ac_add_options --enable-optimize="-g -O2 -fno-schedule-insns"' >> .mozconfig
      echo "ac_add_options --disable-tests" >> .mozconfig
      echo "ac_add_options --disable-debug" >> .mozconfig

      patch -p1 -i ../mozilla-1335250.patch
  fi
}

build() {
  cd "$srcdir/$_pkgname-$_debver"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  export PATH="$srcdir/path:$PATH"

  if $_pgo; then
    # Do PGO
    xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
      make -f client.mk build MOZ_PGO=1
  else
    make -f client.mk build
  fi
}

package() {
  cd "$srcdir/$_pkgname-$_debver"
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 ../vendor.js "$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"

  _brandingdir=debian/branding
  brandingdir=moz-objdir/$_brandingdir
  icondir="$pkgdir/usr/share/icons/hicolor"
  for i in 16 22 24 32 48 64 128 192 256 384; do
    rsvg-convert -w $i -h $i "$_brandingdir/${pkgname}_icon.svg" \
      -o "$brandingdir/default$i.png"
    install -Dm644 "$brandingdir/default$i.png" \
      "$icondir/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 "$_brandingdir/${pkgname}_icon.svg" \
    "$icondir/scalable/apps/$pkgname.svg"

  install -d "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications"

  # Use system-provided dictionaries
  rm -rf "$pkgdir/usr/lib/$pkgname/"{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -s /usr/share/hyphen   "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf $pkgname "$pkgdir/usr/lib/$pkgname/$pkgname-bin"
}
