# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=qstopmotion
pkgver=2.5.0
pkgrel=2
pkgdesc="Application for creating stop-motion animation movies"
url="http://qstopmotion.org/"
license=(GPL2)
arch=(x86_64)
depends=(ffmpeg libgphoto2 qt5-multimedia qwt v4l-utils)
makedepends=(cmake)
source=("https://downloads.sourceforge.net/$pkgname/Version_${pkgver//./_}/$pkgname-$pkgver-Source.tar.gz"
        "qstopmotion.appdata.xml")
sha256sums=('1df93e4a42898f4fd6c5ab35bbc82e38e367e7dd3885b44d025ac0d0cb1828d0'
            'fd0c4a63f3cd407143257141ab50cacd500821ded2ba1141a6b54def3490b3f1')

prepare() {
  [[ -d build ]] || mkdir build
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../$pkgname-$pkgver-Source/ \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
