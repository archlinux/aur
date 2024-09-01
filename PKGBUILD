# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugin-openh264
_pkgname=gst-plugins-bad
pkgver=1.24.7
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenH264 plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs openh264)
makedepends=(meson glib2-devel)
conflicts=('gst-plugins-openh264')
replaces=('gst-plugins-openh264')
source=(${url}src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz)
sha256sums=('75d513fc0ba635fb1f39786d890b73fbac5f4bc88ff39f2a9ff62f4b8f428f22')

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
