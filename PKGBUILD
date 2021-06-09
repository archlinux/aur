# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi
pkgver=1.4.4
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('meson' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('659047caaf6c8e310036e7b06ed503480abeb5fb56cb2dd45b7701586f1ddd9e')

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
