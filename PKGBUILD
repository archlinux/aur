# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=hexgui
pkgver=0.9.2
pkgrel=2
pkgdesc='SGF editor and engine client for the board game Hex'
arch=('any')
url='http://sourceforge.net/p/benzene/hexgui'
license=('GPL3')
depends=('bash' 'java-runtime')
makedepends=('apache-ant' 'java-environment')
install=${pkgname}.install
source=("https://github.com/apetresc/hexgui/archive/v$pkgver.tar.gz"
        'hexgui'
        'hexgui.xml'
        'hexgui.desktop')
md5sums=('5456c74b6e2ff619bc8f488128f02764'
         '77035cf26c8a2e4c656ad874b44ccf29'
         'df0600845bfe27c7f5775f274ee12202'
         'd6c7e88fb22bff99ef68efc26ccb8d56')

build() {
  cd $pkgname-$pkgver

  ant
}

check() {
  cd $pkgname-$pkgver
  bin/hexgui -version
}

package() {
  mkdir -p $pkgdir/usr/share/java/hexgui
  mkdir -p $pkgdir/usr/bin

  cp $srcdir/$pkgname-$pkgver/lib/hexgui.jar $pkgdir/usr/share/java/hexgui/hexgui.jar
  cp hexgui $pkgdir/usr/bin/hexgui
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
