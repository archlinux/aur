# Maintainer:	Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:	AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:	Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>
pkgname=ovito
pkgver=2.7.0
pkgrel=1
pkgdesc="A scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'qt5-svg' 'ffmpeg2.8' 'mpfr')
conflicts=('ovito-git')
md5sums=('')
source=("http://www.ovito.org/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")

if [[ $CARCH = i686 ]];then
  md5sums[0]='6ABF21EC650F5298BCA20B2EBA09645D'
else
  md5sums[0]='F8F5685F0D7E13A9F0AF96308FA16499'
fi

package() {
  cd ${pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/usr
  rm -rf LICENSE.txt README.txt
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/usr
  # fix libGL library conflict errors
  rm -r ${pkgdir}/usr/lib/ovito/libstdc++.so.{6,6.0.18}
}
