# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman-indicator
_subname=vindicator
pkgver=1.4.3
pkgrel=2
pkgdesc="LibIndicator support for WifiMan. Written in Vala"
arch=('any')
url='https://github.com/BiteDasher/wifiman-indicator'
license=('MIT')
depends=('wifigui' 'gtk3' 'polkit' 'xdg-user-dirs')
makedepends=('vala' 'gtk3' 'binutils' 'libappindicator-gtk3')
optdepends=(
	'dhclient: DHCP client'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman-indicator/archive/${pkgver}.tar.gz"	
	"git+https://github.com/platofff/vindicator.git"
)
sha256sums=("f47d9b6b3783ac7e40e3bea531fe78cae0078f75922a826b25fc4cf98bf40f49"
            "SKIP")
package() {
mv $_subname/Makefile $_subname/vindicator.vala $srcdir/$pkgname-$pkgver/$_subname
cd $srcdir/$pkgname-$pkgver
make all
make PREFIX="$pkgdir/usr" PK_DEST="$pkgdir/usr/share/polkit-1/actions" PK_EXEC_DEST="\/usr\/bin" XDG_DEST="$pkgdir/etc/xdg/autostart" install
}
