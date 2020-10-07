# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.0.0
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("https://github.com/MyHush/SilentDragon/archive/v$pkgver.tar.gz")
sha256sums=('4fb3b8696eb31905571793061de8166a96de89349e35bd8a12903b8089fc5136')

build() {
  tar xzvf v$pkgver.tar.gz
  cd "SilentDragon-$pkgver"
  ./build.sh linguist
  ./build.sh release
}

package() {
  install="${pkgbase}.install"

  cd "SilentDragon-$pkgver"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /opt/${pkgname}/silentdragon "${pkgdir}/usr/bin"
}

