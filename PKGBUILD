# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=kcm-fcitx
pkgver=0.5.5
pkgrel=3
pkgdesc="KDE Config Module for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-qt5' 'knewstuff' 'kcmutils')
makedepends=('extra-cmake-modules')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz"{,.sig}
        $pkgname-gcc-10.patch::https://github.com/fcitx/kcm-fcitx/commit/a1b2ccdffd9e4d16c47f7f2a596df437ee834c41.patch)
sha512sums=('e6a7bcad10003a956389ee266cf6d2f3730dafafcdd0bb43de328397749775e5cd305f16fdca2365e246c903677dba042da81a6dfd873aa1be74174e2b0b372e'
            'SKIP'
            'bc57656eb6379701d25370da823b70bff7d4f355f7cfbf6782059161e14c4f3a14c32bf0760b794f8d7e9cb2b5d4c3072ac705090782163187f0636b3af81102')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < $pkgname-gcc-10.patch
  mkdir build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
