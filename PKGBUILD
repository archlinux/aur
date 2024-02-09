# Maintainer: Ha Ma <0xcccc@bupt.cn>

_name=kholidays
pkgname=${_name}5-cn
base_pkgver=5.114.0
pkgver=${base_pkgver}_20240209
pkgrel=1
pkgdesc='KDE library for regional holiday information(CN)'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base)
makedepends=(extra-cmake-modules qt5-declarative qt5-tools qt5-doc doxygen python)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<1:5.111" "kholidays5")
replaces=("$_name<1:5.111" "kholidays5")
provides=("kholidays5")
groups=(kf5)
source=(
    https://download.kde.org/stable/frameworks/${base_pkgver%.*}/$_name-$base_pkgver.tar.xz
    https://github.com/0xcccccccccccc/kholidays_cn/releases/20240209/download/holiday_cn_zh-cn
)
sha256sums=('be4af6625e80852cb7bc8cdbe2bdd56ccf3868644cbfb87d3494964f5f6f28a7'
            '406e9a80edb51cdcc7a0116cd278a501deeb9d269bcb813b3cf3ccabefadfc7e')

build() {
  cp $srcdir/holiday_cn_zh-cn $srcdir/kholidays-$base_pkgver/holidays/plan2/
  cmake -B build -S $_name-$base_pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
