# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.5
pkgrel=1
[[ "$CARCH" == 'x86_64' ]] && arch=64
[[ "$CARCH" == 'i686' ]] && arch=32
_pkgver=linux-$arch-$pkgver
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/$pkgname-${_pkgver}.zip"
	"traccar.service")
md5sums=('a01bcaca0661327069f6be735511508d'
	 '0c5ebc020df4d1710c555b67e87e104f')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='c8b84f0d676d0194ff4fc8398281b42f'
 
package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}

