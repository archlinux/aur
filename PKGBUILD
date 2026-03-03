pkgbase=qt-style-globalqss
pkgname=('qt5-style-globalqss' 'qt6-style-globalqss')
pkgver=1.0.0
pkgrel=1
pkgdesc="GlobalQSS style engine for Qt"
arch=('x86_64')
url='https://github.com/luigifab/globalqss'
license=('GPL2')
makedepends=('cmake' 'qt5-base>=5.15.0' 'qt6-base')
source=("https://github.com/luigifab/globalqss/archive/v${pkgver}/globalqss-${pkgver}.tar.gz")
sha256sums=("5ed699b2d36a8c296e219c8f6b5d18dea4144e1d1c08797e6b355628106f4ca6")

prepare() {
  mv "globalqss-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  cmake -S src-5 -B build-qt5
  cmake -S src-6 -B build-qt6
  make -s -C build-qt5
  make -s -C build-qt6
}

package_qt5-style-globalqss() {
  pkgdesc+=" 5"
  depends+=('qt5-base>=5.15.0')

  cd "$pkgbase-$pkgver"

  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/qt5-style-globalqss.sh"
  install -Dpm 644 build-qt5/libglobalqssplugin.so "$pkgdir/usr/lib/qt5/plugins/styles/libglobalqssplugin.so"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_qt6-style-globalqss() {
  pkgdesc+=" 6"
  depends+=('qt6-base')

  cd "$pkgbase-$pkgver"

  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/qt6-style-globalqss.sh"
  install -Dpm 644 build-qt6/libglobalqssplugin.so "$pkgdir/usr/lib/qt6/plugins/styles/libglobalqssplugin.so"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
