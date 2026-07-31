# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kdiagram
pkgname=${_name}5
pkgver=2.8.0
pkgrel=3
pkgdesc='Powerful libraries for creating business diagrams'
arch=(x86_64)
url='https://www.kde.org/'
license=(GPL2)
depends=(qt5-svg)
makedepends=(extra-cmake-modules qt5-tools)
conflicts=('kdiagram<2.8.0-2')
replaces=('kdiagram<2.8.0-2')
source=(https://download.kde.org/stable/$_name/$pkgver/$_name-$pkgver.tar.xz{,.sig}
        kdiagram-2.8.0-ecm-project-version.patch)
sha256sums=('579dad3bd1ea44b5a20c0f133ebf47622e38960f9c7c8b3a316be30a369f431f'
            'SKIP'
            '58e5ef79f0432bc469ae88eaeb3b3aba616ae52749bde4ed35b607aef14bf91e')
validpgpkeys=(42A60D06F449E895F40F09C01638B8A616108B8A) # Dag Andersen <danders@get2net.dk>

prepare() {
  patch -d $_name-$pkgver -p1 < kdiagram-2.8.0-ecm-project-version.patch
}

build() {
  cmake -B build -S $_name-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
