# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.2+20250127
_pkgver=${pkgver/+/.}
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(x86_64)
url=https://xff.cz/megatools
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://xff.cz/megatools/builds/builds/$pkgname-$_pkgver.tar.gz{,.asc})
sha256sums=('222a9292542d056b00098bf0a604ea4d0c00764a05c84447e77a856df7c3bbf6'
            'SKIP')
validpgpkeys=(EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED) # Ondrej Jirman <megous@megous.com>

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
