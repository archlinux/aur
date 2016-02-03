# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=gimp-blacksilk-plugin
_pkgname=BlackSilk.GIMP
pkgver=1.0.0_RC2
_pkgver=1.0.0-RC2
pkgrel=1
pkgdesc='An intuitive black and white conversion software with focus on a responsive user
interface and workflow - gimp plugin'
arch=('i686' 'x86_64')
url='http://fd-imaging.com/apps-2/blacksilk-bw-toolkit/'
license=('GPL')
depends=(
qt5-quick1
qt5-multimedia
postgresql-libs
gimp
qt5-svg
)
makedepends=(chrpath)
install='blacksilk.install'
source=("http://fd-imaging.com/files/blacksilk/releases/BlackSilk.GIMP.${_pkgver}.linux.zip")
sha256sums=('94690cdd3b34fb53d5a874e20fb7e2b709c2116179a999a771c0fdab5ba4ea52')

build() {
  cd "$srcdir"/${_pkgname}.${_pkgver}.linux
  find -type f -a -name '*.so*' -exec chrpath -d '{}' ';'
}
package(){
  cd "$srcdir"/${_pkgname}.${_pkgver}.linux
  install -Dm755 BlackSilkGIMP "$pkgdir"/usr/lib/gimp/2.0/plug-ins/BlackSilkGIMP
  cp -r libBlackSilk "$pkgdir"/usr/lib/gimp/2.0/plug-ins
  cp -r blacksilk_qt_plugins  "$pkgdir"/usr/lib/gimp/2.0/plug-ins
}

