# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=blacksilk
_pkgname=BlackSilk.Standalone
pkgver=1.0.0_RC2
_pkgver=1.0.0-RC2
pkgrel=1
pkgdesc='an intuitive black and white conversion software with focus on a responsive user interface and workflow'
arch=('i686' 'x86_64')
url='http://fd-imaging.com/apps-2/blacksilk-bw-toolkit/'
license=('GPL')
depends=(
qt5-quick1
libpng12
postgresql-libs
qt5-svg
lcms2
# gcc-libs
qt5-multimedia
)
makedepends=(
chrpath
imagemagick
)
source=(
https://fd-imaging.com/files/blacksilk/releases/BlackSilk.Standalone.${_pkgver}.linux.zip
https://fd-imaging.com/wp-content/uploads/2012/03/Black_Silk_Logo_Big.png
blacksilk.desktop
)
sha256sums=('378dc74906e27185e45f9981b5cd0eb271ec2bc29de4ef0a2cc816e6da206927'
            '2b2b7d572b0e7d52ded83180aa2f3d8a31af472685fbf436b0b9b448279c07f8'
            '4e3e81eb78fcfdc643708e6a38600d5045ff4302b3515af3cd16193914d0fe05')

build() {
  cd "$srcdir"/${_pkgname}.${_pkgver}.linux
  find -type f -a -name '*.so*' -exec chrpath -d '{}' ';'
  convert ../Black_Silk_Logo_Big.png -resize 128 ../blacksilk.png
}
package(){
  cd "$srcdir"/${_pkgname}.${_pkgver}.linux
  install -dm755 "$pkgdir"/opt/blacksilk
  install -dm755 "$pkgdir"/usr/bin
  cp -r ./  "$pkgdir"/opt/blacksilk
  install -Dm644 ../blacksilk.desktop "$pkgdir"/usr/share/applications/blacksilk.desktop
  install -Dm644 ../blacksilk.png "$pkgdir"/usr/share/icons/blacksilk.png
  cd "$pkgdir"/usr/bin
  ln -s /opt/blacksilk/BlackSilk blacksilk

}

