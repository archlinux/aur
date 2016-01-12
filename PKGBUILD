pkgname=cococpp
pkgver=20120102
pkgrel=1
pkgdesc="Coco is a compiler generator"
arch=('i686' 'x86_64')
url="http://www.ssw.uni-linz.ac.at/Research/Projects/Coco/#CPP"
license=('GPL')
makedepends=('unzip')
source=("http://www.ssw.uni-linz.ac.at/Research/Projects/Coco/CPP/CocoSourcesCPP.zip"
        "http://www.ssw.uni-linz.ac.at/Research/Projects/Coco/Doc/license.txt")
md5sums=('39bef530693d5372ef15af3062f11f8b'
         '70ff85f9908c38e9542a0bae936e36f6')
noextract=("CocoSourcesCPP.zip")

build() {
  mv "CocoSourcesCPP.zip" "CocoSourcesCPP-${pkgver}.zip"
  cd "${srcdir}"
  mkdir "${pkgname}-${pkgver}"
  unzip "CocoSourcesCPP-${pkgver}.zip" -d ${pkgname}-${pkgver}

  cd "${pkgname}-${pkgver}"
  chmod +x build.sh
  ./build.sh
}

package() {
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/Coco \
    ${pkgdir}/usr/bin/cococpp
  install -D -m644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

