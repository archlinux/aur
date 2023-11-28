# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugin-openh264
_pkgname=gst-plugins-bad
pkgver=1.22.7
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenH264 plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs openh264)
makedepends=(meson git)
conflicts=('gst-plugins-openh264')
replaces=('gst-plugins-openh264')
source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz)
sha256sums=('c716f8dffa8fac3fb646941af1c6ec72fff05a045131311bf2d049fdc87bce2e')

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
