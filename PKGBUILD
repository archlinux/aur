# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.4.2
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports z-addresses'
url='https://git.hush.is/hush/SilentDragon'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rust' 'wget')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
        'silentdragon.png'
        'silentdragon.desktop')
sha512sums=('62684bad8158f191fc4adde579d383233c24d5318cf0cab4ac2b08c364bc1d4106c3c0228a9d8f808153114e735d2ba07e9344da448fc7692d58c8218d5c49b9'
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

