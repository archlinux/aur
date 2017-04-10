# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>
_pkgname=ovito
pkgname=ovito-opt
pkgver=2.7.0
pkgrel=1
pkgdesc="A scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'qt5-svg' 'ffmpeg2.8')
conflicts=('ovito' 'ovito-git')
md5sums=(
    ''
    '2b86c33c121e442ee443168e6414cc2f'
    'a7e384fcc9ed17cf85205945336a5f49'
)
source=(
    "http://www.ovito.org/download/$pkgver/${_pkgname}-$pkgver-$CARCH.tar.gz"
    'launcher-ovito.sh'
    'launcher-ovitos.sh'
)

if [[ $CARCH = i686 ]];then
  md5sums[0]='6abf21ec650f5298bca20b2eba09645d'
else
  md5sums[0]='f8f5685f0d7e13a9f0af96308fa16499'
fi

package() {
  cd ${_pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/opt/ovito
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/opt/ovito
  # fix libGL library conflict errors
  rm -r ${pkgdir}/opt/ovito/lib/ovito/libstdc++.so.{6,6.0.18}

  install -Dm755 ${srcdir}/launcher-ovito.sh ${pkgdir}/usr/bin/ovito
  install -Dm755 ${srcdir}/launcher-ovitos.sh ${pkgdir}/usr/bin/ovitos
}
