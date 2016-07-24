# Maintainer: Ricardo Cabral <ricardo.arturo.cabral@gmail.com>
_name="Tibia"
pkgname=tibia
pkgver=1096
pkgrel=1
pkgdesc="A fast-paced free massively multiplayer online role-playing game."
arch=('i686' 'x86_64')
url="http://www.tibia.com"
license=('custom')
depends_i686=('glu' 'mesa')
depends_x86_64=('lib32-glu' 'lib32-mesa')
makedepends=('gendesk' 'python-html2text')
provides=('tibia')
install=${pkgname}.install

source=("http://static.tibia.com/download/tibia${pkgver}.tgz"
	'http://www.tibia.com/support/agreement.php')

sha256sums=('11bec465da38ae8e6d4d773c54142fa38b6f99207b3a9ce118917e31b32a6488'
	'fb192d96b893d012c0ecbf216885846c2826bdb72ae7824879959d3b01564f34')

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

