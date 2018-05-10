# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.4.0
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('meson' 'vala')
replaces=('haguichi-indicator')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('0cf56ff900dc39f4c115a6a86361cc4c2743cc7a180769f2f4446ad3315f5d0f')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  meson -Denable-appindicator=true ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $pkgname-$pkgver/build install
}
