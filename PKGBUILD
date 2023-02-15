# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.1+20230212
_pkgver=${pkgver/+/.}
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://megatools.megous.com
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x meson)
source=(https://megatools.megous.com/builds/$pkgname-$_pkgver.tar.gz)
sha512sums=('8d96533c6ae117f38e095b16f4c3241a9170397174befaff9caf81b598addbe60c89c05d29b20efead462a8f263f799107653cab1ad429ab2ba2fe0dc4fbbb39')

build() {
  arch-meson $pkgname-$_pkgver build -D symlinks=true -D man=true

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
