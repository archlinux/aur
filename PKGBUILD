# Maintainer: 
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.3.20250203
_pkgver=${pkgver/+/.}
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(x86_64)
url=https://xff.cz/megatools
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://xff.cz/megatools/builds/$pkgname-$_pkgver.tar.gz{,.asc})
sha256sums=('37a426ecd360220c9d6c1389c19a9e8f3e07077a9d996e3fd9f756657c1df0a9'
            'SKIP')
validpgpkeys=(EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED) # Ondrej Jirman <megous@megous.com>

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
