# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman-indicator
_subname=vindicator
pkgver=1.0
pkgrel=2
pkgdesc="LibIndicator support for WifiMan. Written in Vala"
arch=('any')
url='https://github.com/BiteDasher/wifiman-indicator'
license=('MIT')
depends=('wifigui' 'zenity' 'gtk3' 'sudo')
makedepends=('vala' 'gtk3' 'binutils')
optdepends=(
	'dhclient: DHCP client'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman-indicator/archive/${pkgver}.tar.gz"	
	"git+https://github.com/platofff/vindicator.git"
)
sha256sums=("731ec5942c1622a30475e3b2353ead06110ed769994f90dc479066ad03181274"
            "SKIP")
package() {
mv $_subname/Makefile $_subname/vindicator.vala $srcdir/$pkgname-$pkgver/$_subname
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" SYSTEMD_DEST="$pkgdir/usr/lib/systemd/user" all
make PREFIX="$pkgdir/usr" SYSTEMD_DEST="$pkgdir/usr/lib/systemd/user" install
}
