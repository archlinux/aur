# Maintainer: Novaturiente
# Prebuilt WebKitGTK 6.0 for novabrowser-webkit: PGO + x86-64-v3 + ThinLTO, no
# introspection/docs, plus the colour-filter patch (dark mode keeps dark parts dark).
# Build recipe and patch: https://github.com/Novaturiente/novabrowser-webkit/tree/master/spikes/wk-build
# Upstream source: https://webkitgtk.org/releases/webkitgtk-$pkgver.tar.xz
pkgname=webkitgtk-6.0-nova-bin
pkgver=2.54.2
pkgrel=2
pkgdesc="Web content engine for GTK 4 (PGO + x86-64-v3 + ThinLTO build with novabrowser patches, prebuilt)"
url="https://github.com/Novaturiente/novabrowser-webkit"
arch=(x86_64)
license=('LGPL-2.1-or-later' 'BSD-2-Clause')
depends=(at-spi2-core atk bubblewrap cairo enchant expat fontconfig freetype2 gdk-pixbuf2
  glib2 glibc gst-plugins-bad-libs gst-plugins-base-libs gstreamer gtk4 harfbuzz harfbuzz-icu
  hyphen icu lcms2 libatomic libavif libdrm libegl libepoxy libgcc libgcrypt libgl libgles
  libjpeg-turbo libjxl libmanette libpng libseccomp libsecret libsoup3 libstdc++ libsystemd
  libtasn1 libwebp libx11 libxml2 libxslt mesa openjpeg2 pango sqlite ttf-font wayland woff2
  xdg-dbus-proxy zlib)
optdepends=('geoclue: Geolocation support'
  'gst-libav: nonfree media decoding'
  'gst-plugins-bad: media decoding'
  'gst-plugins-good: media decoding')
provides=("webkitgtk-6.0=$pkgver" "webkitgtk-6.0-nova=$pkgver" libjavascriptcoregtk-6.0.so libwebkitgtk-6.0.so)
conflicts=(webkitgtk-6.0 webkitgtk-6.0-nova)
options=(!strip !debug)
_tag=webkitgtk-6.0-nova-$pkgver-$pkgrel
source=("$_tag-x86_64.tar.zst::$url/releases/download/$_tag/$_tag-x86_64.tar.zst")
sha256sums=('8997e67b48d294ba6b161a91e3f1be7a1d94dca4a40f2fbbc4843c075d534aa0')

prepare() {
  /lib/ld-linux-x86-64.so.2 --help 2>/dev/null | grep -q 'x86-64-v3 (supported' || {
    error "this build needs an x86-64-v3 CPU (AVX2: Intel Haswell / AMD Excavator or newer); use webkitgtk-6.0"
    return 1
  }
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
