# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarswm'
pkgver=23.1
pkgrel=1
pkgdesc="LCARS Window Manager for lcarsde"
arch=('any')
url="https://lcarsde.github.io"
license=('GPL2')
groups=('lcarsde')
depends=('libx11' 'libxpm' 'libxrandr' 'pango' 'icu' 'libxml2' 'glib2' 'libxft' 'harfbuzz' 'freetype2' 'libxcrypt-compat')
optdepends=('ttf-ubuntu-font-family' 'alsa-utils')
makedepends=('jdk-openjdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/lcarswm/archive/$pkgver.tar.gz")
md5sums=('9a486fb9877f0c86846835559cf01600')

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
