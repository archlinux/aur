# Maintainer: M0Rf30

pkgname=traccar
pkgver=3.6
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
md5sums=('3d2aece3a0e4c133a97df7873e96e4d9'
	 '0c5ebc020df4d1710c555b67e87e104f')
[[ "$CARCH" == 'x86_64' ]] && md5sums[0]='10fc65e4dea0e7b985bfa82dfc45c0b3'
 
package() {
  cd ${srcdir}
  ./traccar.run --noexec --target $pkgdir/opt/traccar/
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
}

