pkgbase=qt-style-globalqss
pkgname=('qt5-style-globalqss' 'qt6-style-globalqss')
pkgver=1.2.0
pkgrel=1
pkgdesc='GlobalQSS style engine for Qt'
url='https://github.com/luigifab/globalqss'
license=('GPL2')
arch=('x86_64')
makedepends=('cmake' 'qt5-base>=5.10.0' 'qt6-base')
source=("https://github.com/luigifab/globalqss/archive/v${pkgver}/globalqss-${pkgver}.tar.gz")
sha256sums=('263c6bd1f86eac889492e26fa9212329c38d3d695d3b31dd5ea529ce2e214aaa')

prepare() {
  mv "globalqss-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  cmake -S src-5 -B build-qt5
  cmake -S src-6 -B build-qt6
  cmake --build build-qt5
  cmake --build build-qt6
}

package_qt5-style-globalqss() {
  pkgdesc+=" 5"
  depends+=('qt5-base>=5.10.0')
  cd "$pkgbase-$pkgver"
  DESTDIR="$pkgdir" cmake --install build-qt5
  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/qt5-style-globalqss.sh"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_qt6-style-globalqss() {
  pkgdesc+=" 6"
  depends+=('qt6-base')
  cd "$pkgbase-$pkgver"
  DESTDIR="$pkgdir" cmake --install build-qt6
  install -Dpm 644 data/profile.sh "$pkgdir/etc/profile.d/qt6-style-globalqss.sh"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}