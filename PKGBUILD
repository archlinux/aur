# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=gst-plugins-openh264
_pkgname=gst-plugins-bad
pkgver=1.18.4
pkgrel=1
pkgdesc="GStreamer open-source multimedia framework OpenH264 plugins"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(gst-plugins-base-libs openh264)
makedepends=(meson git)
_commit=8cb03bdf01ca6ad8c87f951bcd7962c3ca9f6860  # tags/1.18.4^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build \
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
