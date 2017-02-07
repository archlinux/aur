# Maintainer: Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=scangearmp-mg3500
pkgver=2.20
pkgrel=1
pkgdesc="Canon IJ Printer Driver (for mg3500 series)"
url="http://support-sg.canon-asia.com/contents/SG/EN/0100552102.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('scangearmp-common>=2.20')
makedepends=('binutils' 'tar')
source=(
"http://gdlp01.c-wss.com/gds/1/0100005521/01/scangearmp-mg3500series-${pkgver}-1-deb.tar.gz"
"LICENSE"
)
sha256sums=(
'd4a14171a14c6221c40b589b90945512fbb0762ab4d43fb4bab48f4f858a6340'
'a64e2aa8d6a8c441d749457dffa875836fcd8cd29398ae6040038ad20189c960'
)

if [ ${CARCH} == "x86_64" ]; then
    PKGARCH=amd64
else
    PKGARCH=i386
fi

package(){
  cd ${srcdir}/scangearmp-mg3500series-${pkgver}-1-deb/packages
  install scangearmp-mg3500series_${pkgver}-1_${PKGARCH}.deb ${pkgdir}

  cd ${pkgdir}
  ar -x scangearmp-mg3500series_${pkgver}-1_${PKGARCH}.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mg3500series_${pkgver}-1_${PKGARCH}.deb
  rm data.tar.gz

  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
