# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=lib32-freealut
pkgver=1.1.0
pkgrel=4
pkgdesc="OpenAL Utility Toolkit (ALUT). Multilib."
arch=('x86_64')
url="http://www.openal.org/"
license=('LGPL')
depends=('lib32-openal' "freealut")
makedepends=('gcc-multilib')
#source=("http://connect.creativelabs.com/openal/Downloads/ALUT/freealut-$pkgver.tar.gz")
source=("http://pkgs.fedoraproject.org/repo/pkgs/freealut/freealut-$pkgver.tar.gz/e089b28a0267faabdb6c079ee173664a/freealut-$pkgver.tar.gz")
md5sums=('e089b28a0267faabdb6c079ee173664a')

prepare() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
}

build() {
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