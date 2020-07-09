# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.3.8
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
conflicts=('silentdragonlite-appimage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MyHush/SilentDragonLite/archive/$pkgver.tar.gz")
sha256sums=('9a1e3eba8958c4bcc0e9fb2decf82bcd9f6b0833983c4d885d4c5cea3638d5ab')

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
  
  # links to /usr/bin
  ln -s /opt/${pkgname}/silentdragonlite "${pkgdir}/usr/bin"
}
