# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.1+20241028
_pkgver=${pkgver/+/.}
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(x86_64)
url=https://megatools.megous.com
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://megatools.megous.com/builds/$pkgname-$_pkgver.tar.gz{,.asc})
sha256sums=('3632135a23aa737950e74183199eb23d4e44461ca4221842717225fb31527a4d'
            'SKIP')
validpgpkeys=(EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED) # Ondrej Jirman <megous@megous.com>

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
