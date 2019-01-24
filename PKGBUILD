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
sha256sums=('fa968179d063b3ee6a0047ca70f5948f2f572f82a9194731ad0252ff8c1f7223'
            'd78f94c8894f8fa8811f00b1c13ab82a0cfc0aa000b6494049464654bd90ecd3')
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

