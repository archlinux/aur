# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=lib32-freealut
pkgver=1.1.0
pkgrel=6
pkgdesc="OpenAL Utility Toolkit (ALUT). Multilib."
arch=('x86_64')
url="http://www.openal.org/"
license=('LGPL')
depends=('lib32-openal' "freealut")
makedepends=('gcc-multilib')
source=("http://pkgs.fedoraproject.org/repo/pkgs/freealut/freealut-$pkgver.tar.gz/e089b28a0267faabdb6c079ee173664a/freealut-$pkgver.tar.gz")
sha512sums=('270f74972548b4ac6b98c52c51787ed43c20cf79979063d073bbee7bd08ac4f34c2b579fbf15c09c4e606a5ed38dcd0252f5c46fb3cfe43b727b6b53cf747933')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  cd freealut-$pkgver
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-static=no
  make
}

package() {
  cd freealut-$pkgver
  make DESTDIR="$pkgdir/" install -C src
  make DESTDIR="$pkgdir/" install-pkgconfigDATA -C admin/pkgconfig
}
