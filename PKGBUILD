# Maintainer: Popolon <popolon (aL popolon d0t org>
# Contributor: Nazar Mishturak <nazarmx@gmail.com>

pkgname=libva-v4l2-request
pkgver=1.3
pkgrel=1
pkgdesc="LibVA implementation for the Linux Video4Linux2 Request API"
arch=(x86_64 i686 arm armv6h armv7h aarch64 riscv64 loong64)
url="https://github.com/sofus13/libva-v4l2_request/"
license=('LGPL2.1' 'MIT')
depends=('libva>=2.1.0' 'libdrm>=2.4.52')
provides=(libva-v4l2-request v4l2_request_drv_video.so)
conflicts=(libva-v4l2-request)
makedepends=(git patch meson)
source=("https://github.com/sofus13/libva-v4l2_request/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3670a1712f9f0a5a61bd44a781eba81dd9b2e0fd8271417ca8a9fbbed9dccfe9')

prepare() {
  meson setup --prefix /usr --buildtype=plain libva-v4l2_request-${pkgver} build
}

build() {
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  
  cd "$srcdir/libva-v4l2_request-${pkgver}"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
