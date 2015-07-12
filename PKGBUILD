# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: MagicSeb
pkgname=scangearmp-common-mg3500series
pkgcommon=scangearmp-common
pkgver=2.20
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (Common package)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100470402.html"
license=('custom')
depends=('gtk2>=2.4.0' 'libpng12' 'pangox-compat' 'libusb-compat')
optdepends=('sane' 'gimp>=2.0.0')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/0/0100005520/01/scangearmp-mg3500series-2.20-1-rpm.tar.gz")
md5sums=('78aca903bc0281be1e79a0bc276c7f15')

build() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name $pkgcommon-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name $pkgcommon-$pkgver*i386*.rpm)
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
