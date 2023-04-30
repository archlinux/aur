# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.4.6
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'logmein-hamachi')
makedepends=('meson' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('0807e22914c16b55f6afac04a7943f049da5eccd8664ff7a47193ac133bb3330')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  meson setup -Denable-appindicator=true ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $pkgname-$pkgver/build install
}
