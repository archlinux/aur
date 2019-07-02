# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=ps3netsrv
_wMM_version=1.47.24
pkgver=20190701
pkgrel=1
pkgdesc='PS3 Net Server (mod by aldostools)'
arch=('x86_64')
url='https://github.com/aldostools/webMAN-MOD/'
license=('MIT')
depends=('gcc-libs')
backup=("etc/conf.d/${pkgname}")
source=(
	"https://github.com/aldostools/webMAN-MOD/releases/download/${_wMM_version}/ps3netsrv_${pkgver}.zip"
	"${pkgname}.service"
	"${pkgname}.conf"
)

sha512sums=(
	'37484c64249bc72b260405ab6854c84ea69873d7836de76a6fcb7dc2dc70565b90d5c9749a9217219d4f6d5eedf52f7af27c4fee7a63bd60ec372526dff30427'
	'ce955bbaf577963244a6e96a8a8fffe037e5067321bc507fe7f71b12d8e198b5280de708dd9cffbf59d0c9a82e05bf9901dbcc8f8bc0d548b2d2c2ead7e07941'
	'c81e3ef6a4bf07cd150b205793ca5a3886cf9d76c1087cc1d1325ca779628c074cfcbe8349b0bda691f61ab4f394d8594af1ed945c7207acc5712057dc5fbe59'
)

prepare() {
	cd "${srcdir}/${pkgname}"
	sed 's/\r$//' -i Make.sh
	chmod +x Make.sh
}

build() {
	cd "${srcdir}/${pkgname}"
	./Make.sh
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/ps3netsrv" "$pkgdir/usr/bin/ps3netsrv"
	install -Dm644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.conf" "$pkgdir/etc/conf.d/${pkgname}"
	install -Dm644 "${srcdir}/LICENSE.TXT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.TXT"

echo 'u ps3netsrv - "PS3 Net Server daemon"' |
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

}
