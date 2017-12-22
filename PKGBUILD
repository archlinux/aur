# Maintainer: nl6720 <nl6720@gmail.com>

pkgname=ps3netsrv
pkgver=1.47.06
pkgrel=1
pkgdesc='PS3 Net Server (mod by aldostools)'
arch=('x86_64')
url='https://github.com/aldostools/webMAN-MOD/'
license=('MIT')
depends=('gcc-libs')
backup=("etc/conf.d/${pkgname}")
source=(
	"webMAN-MOD-${pkgver}.tar.gz::https://github.com/aldostools/webMAN-MOD/archive/${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.conf"
)

sha512sums=(
	'11470731892f2e8d8a99651fbab60225856960bbc5db625dcf51101f77a701e1157314cb48f7b79ad011265191853ebf8bfee490e450f38775e405cf6895c26c'
	'ce955bbaf577963244a6e96a8a8fffe037e5067321bc507fe7f71b12d8e198b5280de708dd9cffbf59d0c9a82e05bf9901dbcc8f8bc0d548b2d2c2ead7e07941'
	'c81e3ef6a4bf07cd150b205793ca5a3886cf9d76c1087cc1d1325ca779628c074cfcbe8349b0bda691f61ab4f394d8594af1ed945c7207acc5712057dc5fbe59'
)

prepare() {
	cd "${srcdir}/webMAN-MOD-${pkgver}/_Projects_/${pkgname}"
	chmod +x Make.sh
}

build() {
	cd "${srcdir}/webMAN-MOD-${pkgver}/_Projects_/${pkgname}"
	./Make.sh
}


package() {
	install -Dm755 "${srcdir}/webMAN-MOD-${pkgver}/_Projects_/${pkgname}/ps3netsrv" "$pkgdir/usr/bin/ps3netsrv"
	install -Dm644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.conf" "$pkgdir/etc/conf.d/${pkgname}"
	install -Dm644 "${srcdir}/webMAN-MOD-${pkgver}/_Projects_/${pkgname}/LICENSE.TXT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.TXT"

echo 'u ps3netsrv - "PS3 Net Server daemon"' |
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

}
