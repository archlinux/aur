# Maintainer: Scientress

pkgname=gst-plugin-ndi-git
pkgver=r244.12656af
pkgrel=1
pkgdesc="GStreamer plugin for NDI"
arch=("x86_64")
url="https://github.com/teltek/gst-plugin-ndi"
license=('LGPL')
depends=('gstreamer' 'libndi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'rust')
source=("${pkgname%-git}::git+https://github.com/teltek/gst-plugin-ndi.git")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${pkgname%-git}"
  cargo build --release
}

package() {
  install -D "${pkgname%-git}"/target/release/libgstndi.so -t "${pkgdir}/usr/lib/gstreamer-1.0/"
  install -D "${pkgname%-git}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
