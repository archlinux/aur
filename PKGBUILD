# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarswm'
pkgver=21.2
pkgrel=1
pkgdesc="LCARS Window Manager for lcarsde"
arch=('any')
url="https://lcarsde.github.io"
license=('GPL2')
groups=('lcarsde')
depends=('libx11' 'libxpm' 'libxrandr' 'pango' 'icu' 'libxml2' 'glib2' 'libxft' 'harfbuzz' 'freetype2')
optdepends=('ttf-ubuntu-font-family' 'alsa-utils')
makedepends=('jdk-openjdk' 'ncurses5-compat-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/lcarswm/archive/$pkgver.tar.gz")
md5sums=('a2e5fa971c1592c5e24654586001bf2d')

build() {
  cd "$pkgname-$pkgver"

  ./gradlew build
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp ./build/bin/native/releaseExecutable/lcarswm.kexe "$pkgdir/usr/bin/lcarswm.kexe"
  cp -r ./src/nativeMain/resources/* "$pkgdir/"

  mkdir -p "$pkgdir/usr/share/doc/lcarswm"
  cp ./LICENSE "$pkgdir/usr/share/doc/lcarswm/copyright"
}
