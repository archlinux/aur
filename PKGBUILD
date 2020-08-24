# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.3.9
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
conflicts=('silentdragonlite-appimage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/SilentDragonLite/archive/$pkgver.tar.gz")
sha256sums=('dc164039f937efe1ad308a3971a83921c20691c3c6f8a3cae5883f9043b37136')

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
