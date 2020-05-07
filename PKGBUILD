# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman-indicator
_subname=vindicator
pkgver=1.2
pkgrel=1
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
sha256sums=("7eba3b037b35fe211eb3513aefd2ea54c478f7743008afbccc6b4ea2d2a5bcb9"
            "SKIP")
package() {
mv $_subname/Makefile $_subname/vindicator.vala $srcdir/$pkgname-$pkgver/$_subname
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" SYSTEMD_DEST="$pkgdir/usr/lib/systemd/user" all
make PREFIX="$pkgdir/usr" SYSTEMD_DEST="$pkgdir/usr/lib/systemd/user" install
}
