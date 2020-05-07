# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=0.9.1
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("https://github.com/MyHush/SilentDragon/archive/v$pkgver.tar.gz")
sha256sums=('7cf67937bce5ba4a7f21c513df3ddebb4dbb510ab57ca3fa9494c33e45363367')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "SilentDragon-$pkgver"
  ./build.sh linguist
  ./build.sh release
}

package() {
  install="${pkgbase}.install"

  cd "SilentDragon-$pkgver"
  
  # create the necessary directory structure
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  # install required scripts
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  
  # links to /usr/bin
  ln -s /opt/${pkgname}/silentdragon "${pkgdir}/usr/bin"
}
