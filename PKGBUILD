# Maintainer: Ford Smith <lonelyrustacean@gmail.com>
# Contributo: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-screenshot-copy-patch
pkgver=5.0.0
pkgrel=2
pkgdesc="Easy-to-use screenshot tool for linuxdeepin desktop environment with xclip copy patch"
arch=('x86_64')
url="https://github.com/linuxdeepin/deepin-screenshot"
provides=('deepin-screenshot=5.0.0')
conflicts=('deepin-screenshot')
license=('GPL3')
depends=('deepin-qt5integration' 'dtkwm' 'deepin-turbo')
makedepends=('cmake' 'qt5-tools')
groups=('deepin-extra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/deepin-screenshot/archive/$pkgver.tar.gz"
        deepin-screenshot-no-notification.patch
        deepin-screenshot-copy.patch)
sha512sums=('ad073961deaa78a47739af6cf8b0d0fa77a92ee6668c57f9a5bbf51ad2be1d2028681cffabdc26548be1bdbe24c7ccc7e7ff3d49b86907f794495bfbea62aa30'
            'f3f64b88c6ad1b3ad1f810c76439dea932f9a0810cd9c26a4df095d4a38773a2fc97bde13048244e5585ace0a3c6538e79805b74bc69688d20d8ffa11e758a61'
            'ed7012c3e69966ccdbaef2ed60ddd25c8a480a1d3730823bed2e9a5f7a65751ec78ef4d0886c257a64a7bb22059744603f40dfd8746199ca7461230e53d5ee74')

prepare() {
  cd deepin-screenshot-$pkgver
  patch -p1 -i ../deepin-screenshot-no-notification.patch
  patch src/mainwindow.cpp < $srcdir/deepin-screenshot-copy.patch
}

build() {
  cd deepin-screenshot-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd deepin-screenshot-$pkgver
  make DESTDIR="$pkgdir" install
}
