# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Ex-Maintainer: Nikita Puzyryov <PuzyryovN@gmail.com>
#
# Pull requests are welcome here: https://github.com/yurikoles-aur/zchunk
#

pkgname=zchunk
pkgver=1.5.1
pkgrel=2
pkgdesc='A file format designed for highly efficient deltas while maintaining good compression'
arch=(x86_64)
url=https://github.com/zchunk/zchunk
license=(BSD-2-Clause)
depends=(libcurl.so zstd)
makedepends=(meson)
provides=(libzck.so)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2c187055e2206e62cef4559845e7c2ec6ec5a07ce1e0a6044e4342e0c5d7771d')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
