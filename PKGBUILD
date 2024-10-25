# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.4.3
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports z-addresses'
url='https://git.hush.is/hush/SilentDragon'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
        'silentdragon.png'
        'silentdragon.desktop')
sha512sums=('1820e8705d1c0e3e1fee87c4b480be85f62abc5d753f30bce683ea49e23e63f48f7ee544422e462564043e228a3c7952cec0b46565f5374f710bbea05917ed8c'
            '0b887786a3be6e0643f8d047b0c934036bb71d203e09e692bc2af056d8b23d8469feaff0f952642b1a087f09db159c692fe89aaa4e49802602c4044f9f0620a5'
            '1bc66a8e732c878f92a508633faef7ca4d9cfd05ab68ba670a342795da0cc453889286ec9b2aa1a6f739db57d2d42fb6a4a5bca1a94390f78d812d2a356c2f87')

build() {
  tar xzvf $pkgname-$pkgver-$pkgrel.tar.gz
  cd "silentdragon"
  ./build.sh linguist
  ./build.sh
}

package() {
  install="${pkgbase}.install"
  install -Dm755 "${srcdir}/$pkgname/$pkgname" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragon "${pkgdir}/usr/bin"
}

