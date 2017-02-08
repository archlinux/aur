# Maintainer: Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=scangearmp-common
pkgver=2.30
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (Common package)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100588302.html"
license=('custom')
depends=('gtk2>=2.4.0' 'libpng12' 'pangox-compat' 'libusb-compat')
optdepends=('sane' 'gimp>=2.0.0')
makedepends=('binutils' 'tar')
options=('emptydirs')
source=(
"http://gdlp01.c-wss.com/gds/3/0100005883/01/scangearmp-e400series-${pkgver}-1-deb.tar.gz"
"LICENSE"
)

sha256sums=(
'e92149a22c55008b069b8748e79f042056dc09d60b6f1dea778baaec19af8b36'
'1b890f509ae6795dfaea46e3a3bed6384d05bc4ef7ac047ec55e72fcb2101822'
)

if [ ${CARCH} == "x86_64" ]; then
    _CARCH=amd64
else
    _CARCH=i386
fi


package() {
  cd ${srcdir}/scangearmp-e400series-${pkgver}-1-deb/packages
  install scangearmp-common_${pkgver}-1_${_CARCH}.deb ${pkgdir}

  cd ${pkgdir}
  ar -x scangearmp-common_${pkgver}-1_${_CARCH}.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_${pkgver}-1_${_CARCH}.deb
  rm data.tar.gz

 install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
