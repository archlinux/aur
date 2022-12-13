# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Steffen Weber <-boenki-gmx-de->

pkgname=otter-browser
pkgver=1.0.02
pkgrel=2
pkgdesc='Web browser aiming to recreate the best aspects of the classic Opera (12.x) UI using Qt5'
arch=('x86_64')
url='https://otter-browser.org/'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-xmlpatterns')
makedepends=('cmake' 'ninja')
source=("https://github.com/OtterBrowser/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d1e090a80fa736cd128f594184817078a08cac31614e85e7838ff1b64511d62d')

prepare() {
  cd $pkgname-$pkgver
  # Fix metainfo file
  sed -i 's/org.otter_browser.Otter_Browser.desktop/otter-browser.desktop/' packaging/$pkgname.appdata.xml
  sed -i '/FILES otter-browser.desktop/a install(FILES packaging/otter-browser.appdata.xml DESTINATION ${CMAKE_INSTALL_PREFIX}/share/metainfo)' CMakeLists.txt
}

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
