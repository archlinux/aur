# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=qstopmotion
pkgver=2.5.2
pkgrel=2
pkgdesc='Application for creating stop-motion animation movies'
url='http://qstopmotion.org/'
license=('GPL2')
arch=('x86_64')
depends=('ffmpeg' 'libgphoto2' 'qt5-multimedia' 'qwt' 'v4l-utils')
makedepends=('cmake' 'ninja')
source=("https://downloads.sourceforge.net/$pkgname/Version_${pkgver//./_}/$pkgname-$pkgver-Source.tar.gz"
        'qstopmotion.appdata.xml')
sha256sums=('8f2054c9a7644ae40a5ceaebe576758f2ea87f5430f12d873f1b8eacf73b4671'
            'fd0c4a63f3cd407143257141ab50cacd500821ded2ba1141a6b54def3490b3f1')

build() {
  cmake -S $pkgname-$pkgver-Source -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
