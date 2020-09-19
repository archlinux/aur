# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.3.10
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
conflicts=('silentdragonlite-appimage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/SilentDragonLite/archive/v$pkgver.tar.gz")
sha256sums=('d0f9c412d45cba54935c2b4ae06dad392314d3a3b7eb40412633c6e568622ad5')

build() {
  tar xzvf $pkgname-$pkgver.tar.gz
  cd "SilentDragonLite-$pkgver"
  ./build.sh
}

package() {
  cd "SilentDragonLite-$pkgver"
  
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  mv SilentDragonLite ${pkgname}
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/opt/${pkgname}"

  # links to /usr/bin
  ln -s /opt/${pkgname}/silentdragonlite "${pkgdir}/usr/bin"
}
