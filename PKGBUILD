# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.2.0
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7f2280d69b64cff73d362da194c529ccc6ca233113c0105604c8c9e1609dcbf5')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "silentdragon"
  ./build.sh linguist
  ./build.sh release
}

package() {
  install="${pkgbase}.install"

  cd "silentdragon"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /opt/${pkgname}/silentdragon "${pkgdir}/usr/bin"
}

