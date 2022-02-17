# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-status-bar'
pkgver=22.1
pkgrel=1
pkgdesc="Menu for lcarsde to display and run installed software"
arch=('any')
url="https://lcarsde.github.io"
license=('MIT')
groups=('lcarsde')
depends=('pango' 'icu' 'libxml2' 'glib2' 'harfbuzz' 'freetype2' 'gtk3')
optdepends=('ttf-ubuntu-font-family' 'alsa-utils' 'pulseaudio')
makedepends=('jdk-openjdk' 'ncurses5-compat-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/status-bar/archive/$pkgver.tar.gz")
md5sums=('c9082a00fa5cbf6f7a498f2e169df3ee')

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
