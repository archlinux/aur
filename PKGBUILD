# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=gst-plugins-rs
pkgver=0.8.3
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=(x86_64)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(Apache LGPL2.1 MIT MPL2)
depends=(gstreamer gtk4 dav1d libsodium libwebp)
makedepends=(git rust meson cargo-c clang)
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git#tag=${pkgver}")
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson build -D csound=disabled -D sodium=system
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
  install -D LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

