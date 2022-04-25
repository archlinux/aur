# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=huhnitor
pkgver=2.0.0
pkgrel=1
pkgdesc='An intergalactic serial monitor for the ESP8266 Deauther v3'
url='https://github.com/SpacehuhnTech/Huhnitor'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
source=("https://github.com/SpacehuhnTech/Huhnitor/archive/$pkgver.tar.gz")
sha256sums=('0fb71a75842a6e977fb079d350e8bbf587448b3c0dedae8f7158f44c28921ad6')

build() {
  tar xzvf $pkgver.tar.gz
  cd "Huhnitor-$pkgver"
  cargo build --release
}

package() {
  cd "Huhnitor-$pkgver"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  install -m 755 target/release/${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}/usr/bin"
}

