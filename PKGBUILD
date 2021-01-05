# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.4.0
pkgrel=1
pkgdesc='HUSH Lite wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust')
conflicts=('silentdragonlite-appimage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7152d2b220f9cd76ced45fc49ef657907cb96781ac24746b6af5546eb2cd8345')

build() {
  tar xzvf $pkgname-$pkgver.tar.gz
  cd "$pkgname"
  ./build.sh
}

package() {
  cd "$pkgname"
  
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  mv SilentDragonLite ${pkgname}
  install -m 755 ${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/opt/${pkgname}"

  # links to /usr/bin
  ln -s /opt/${pkgname}/silentdragonlite "${pkgdir}/usr/bin"
}
