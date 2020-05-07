# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman-indicator
_subname=vindicator
pkgver=1.4
pkgrel=1
pkgdesc="LibIndicator support for WifiMan. Written in Vala"
arch=('any')
url='https://github.com/BiteDasher/wifiman-indicator'
license=('MIT')
depends=('wifigui' 'gtk3' 'polkit' 'xdg-user-dirs')
makedepends=('vala' 'gtk3' 'binutils')
optdepends=(
	'dhclient: DHCP client'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman-indicator/archive/${pkgver}.tar.gz"	
	"git+https://github.com/platofff/vindicator.git"
)
sha256sums=("b80ffc906eabc3922f65077b2ffc21a5cc5dea951a7d291ac48448027a2973b5"
            "SKIP")
package() {
mv $_subname/Makefile $_subname/vindicator.vala $srcdir/$pkgname-$pkgver/$_subname
cd $srcdir/$pkgname-$pkgver
make PREFIX="$pkgdir/usr" PK_DEST="$pkgdir/usr/share/polkit-1/actions" PK_EXEC_DEST="\/usr\/bin" XDG_DEST="$pkgdir/etc/xdg/autostart" all
make PREFIX="$pkgdir/usr" PK_DEST="$pkgdir/usr/share/polkit-1/actions" PK_EXEC_DEST="\/usr\/bin" XDG_DEST="$pkgdir/etc/xdg/autostart" install
}
