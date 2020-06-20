# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=0.9.2
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("https://github.com/MyHush/SilentDragon/archive/v$pkgver.tar.gz")
sha256sums=('488dad66535320675e795ada9ee8d903aa64721a9a866c41a66fb3d7647d9de8')

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

