pkgname=scangearmp-common
pkgver=2.00
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (Common package)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100470402.html"
license=('unknown')
depends=('gtk2>=2.4.0' 'libpng12' 'pangox-compat' 'libusb-compat')
optdepends=('sane' 'gimp>=2.0.0')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/4/0100004704/01/scangearmp-mg5400series-2.00-1-rpm.tar.gz")
md5sums=('378d735249c08affd5284766e7e58d15')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgname-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  rpmextract.sh $rpmfile
  mv usr/lib64 usr/lib
  mv usr/local/share/* usr/share/
  mkdir usr/bin
  mv usr/local/bin/* usr/bin/
  rm -rf usr/local
  chmod 664 $pkgdir/usr/lib/bjlib/canon_mfp_net.ini
}

