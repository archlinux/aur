# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.1+20230212
_pkgver=${pkgver/+/.}
pkgrel=2
pkgdesc='CLI for MEGA'
arch=(x86_64)
url=https://megatools.megous.com
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://megatools.megous.com/builds/$pkgname-$_pkgver.tar.gz{,.asc})
sha256sums=('ecfa2ee4b277c601ebae648287311030aa4ca73ea61ee730bc66bef24ef19a34'
            'SKIP')
validpgpkeys=(EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED) # Ondrej Jirman <megous@megous.com>

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
