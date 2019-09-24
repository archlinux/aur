# Maintainer: Nazar Mishturak <nazarmx@gmail.com>
pkgname=libva-v4l2-request-git
pkgver=2019.03.r7.g7f359be
pkgrel=1
pkgdesc="LibVA implementation for the Linux Video4Linux2 Request API"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/bootlin/libva-v4l2-request"
license=('LGPL2.1' 'MIT')
depends=('libva>=2.1.0' 'libdrm>=2.4.52')
makedepends=(meson)
source=($pkgname::git+https://github.com/bootlin/libva-v4l2-request.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix /usr --buildtype=plain $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 COPYING* "$pkgdir/usr/share/licenses/$pkgname/"
}
