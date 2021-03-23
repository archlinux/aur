# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-status-bar'
pkgver=21.3
pkgrel=1
pkgdesc="Menu for lcarsde to display and run installed software"
arch=('any')
url="https://lcarsde.github.io"
license=('MIT')
groups=('lcarsde')
depends=('pango' 'icu' 'libxml2' 'glib2' 'harfbuzz' 'freetype2' 'gtk3')
optdepends=('ttf-ubuntu-font-family' 'alsa-utils')
makedepends=('jdk-openjdk' 'ncurses5-compat-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/status-bar/archive/$pkgver.tar.gz")
md5sums=('9133f296c748a0c00395eb71d86f692f')

build() {
  cd "status-bar-$pkgver"

  ./gradlew build
}

package() {
  cd "status-bar-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp ./build/bin/native/releaseExecutable/status-bar.kexe "$pkgdir/usr/bin/status-bar.kexe"
  ls
  cp -r ./src/nativeMain/resources/* "$pkgdir/"
}
