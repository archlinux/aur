# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: stanislaw <i@archuser.pp.ru>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Nebulosa <nebulosa2007 na yandekse>
# Contributor: max1m <mr[dot]mxm86[at]gmail[dot]com>

pkgname=2gis
pkgver=3.14.12.0
pkgrel=1
pkgdesc="Geographic Information System (GIS) for some Russian and Ukrainian cities."
arch=('i686' 'x86_64')
url="http://help.2gis.ru/linux/"
license=('Adware')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('wine>=1.5' 'lib32-libldap' 'lib32-libxml2' 'hicolor-icon-theme')
elif [ "${CARCH}" = 'i686' ]; then
depends=('wine>=1.5' 'libxml2' 'hicolor-icon-theme')
fi
makedepends=('xdg-utils')
install=2gis.install

source=("http://download.2gis.ru/arhives/2GISShell-${pkgver}.orig.zip"

	"2gis_16.png"
	"2gis_32.png"
	"2gis_48.png"
	"2gis_64.png"
	"2gis_128.png"
	"2gis_256.png"

	"2gis-launch"
	"2gis.desktop"
	"LICENSE.ru"
	"LICENSE.ua")
md5sums=('cc8281ff42a1eb1803babe2a1dc7232c'

	'3126035adc7f7873d55137bb921e5356'
	'6b37fc39d33dc7123eafa15739c51009'
	'556a7554782ade8f92aa1618db864dea'
	'd81f31d399f8518802e827ee030e09d9'
	'e9d4e16abe81b7f9faccb6b0ffe6be42'
	'a822bf76a89d614bb34019543a31014b'

	'd444c77bbc94c687d8edbee794f8f115'
	'5da78116da466a791741f4c9c29839b7'
	'415c638aa454ab03b1977c5156888e14'
	'841a50883a42fe12688e84f66bd26caf')

package() {
  install -d $pkgdir/opt/2gis
  install -D -m755 -t $pkgdir/opt/2gis $srcdir/2gis/3.0/grym.exe
  install -d $pkgdir/opt/2gis/Plugins
  install -D -m644 -t $pkgdir/opt/2gis/Plugins $srcdir/2gis/3.0/Plugins/*.*
  install -D -m644 LICENSE.ru $pkgdir/usr/share/licenses/2gis/LICENSE.ru
  install -D -m644 LICENSE.ua $pkgdir/usr/share/licenses/2gis/LICENSE.ua
  for size in 16 32 48 64 128 256; do
    install -D -m644 2gis_${size}.png $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/2gis.png
  done
  install -D -m644 2gis.desktop $pkgdir/usr/share/applications/2gis.desktop
  install -D -m755 2gis-launch $pkgdir/usr/bin/2gis
}
