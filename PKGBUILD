# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>
_name="Tibia"
pkgname=tibia
pkgver=1082
pkgrel=1
pkgdesc="A fast-paced free massively multiplayer online role-playing game."
arch=('x86_64')
url="http://www.tibia.com"
license=('custom')
depends=('lib32-glu' 'lib32-mesa')
makedepends=('python-html2text')
provides=('tibia')
install=${pkgname}.install

source=("http://static.tibia.com/download/tibia${pkgver}.tgz"
	'http://www.tibia.com/support/agreement.php' 'tibia.install')

sha256sums=('f5016b13f51dd1bc99251acc56869a3064ebcb137b793d81e290e57e29098953'
	'fb192d96b893d012c0ecbf216885846c2826bdb72ae7824879959d3b01564f34'
	'b4fad80c71133c3209e435d904024261e3a331faaa6a9fcb8cbe99f1ede0c454')

prepare() {
  gendesk -f -n
}

build() {
  cd "$srcdir"
  tar -xf tibia${pkgver}.tgz
  html2text agreement.php > LICENSE
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/opt/Tibia"
  cp -drv --no-preserve=ownership ./Tibia/ "${pkgdir}/opt/"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 Tibia/Tibia.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

