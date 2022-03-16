# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-openh264
_pkgname=gst-plugins-bad
pkgver=1.20.1
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenH264 plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs openh264)
makedepends=(meson git)
source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz)
sha256sums=('09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848')

build() {
  arch-meson $_pkgname-$pkgver build \
    --auto-features=disabled \
    -D openh264=enabled \
    -D package-name="GStreamer Bad Plugins (Arch Linux)" \
    -D package-origin="https://www.archlinux.org/"
  ninja -C build
}

package() {
  install -Dm755 build/ext/openh264/libgstopenh264.so "$pkgdir"/usr/lib/gstreamer-1.0/libgstopenh264.so
}

# vim: ts=2 sw=2 et:
