# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragon
pkgver=1.4.4
pkgrel=1
pkgdesc='HUSH desktop full node GUI wallet that supports z-addresses'
url='https://git.hush.is/hush/SilentDragon'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('libsodium' 'qt5-base' 'qt5-charts' 'qt5-tools')
makedepends=('qtcreator' 'clang' 'curl' 'wget')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
        'silentdragon.png'
        'silentdragon.desktop')
sha512sums=('592f4245c55d11ab1ebd32c76cd7e4e8617eba426d6e34b00911c593f893b09c31b770f95489cb29a6b12e9d2b3b9c824a9bf6f0b9677c8f50824b376862f867'
            '0b887786a3be6e0643f8d047b0c934036bb71d203e09e692bc2af056d8b23d8469feaff0f952642b1a087f09db159c692fe89aaa4e49802602c4044f9f0620a5'
            '1bc66a8e732c878f92a508633faef7ca4d9cfd05ab68ba670a342795da0cc453889286ec9b2aa1a6f739db57d2d42fb6a4a5bca1a94390f78d812d2a356c2f87')

build() {
  tar xzvf $pkgname-$pkgver-$pkgrel.tar.gz
  cd "$pkgname"
  ./build.sh -l
  ./build.sh -d
}

package() {
  install="${pkgbase}.install"
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/opt/$pkgname/$pkgname"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/opt/$pkgname/$pkgname.png"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/$pkgname/silentdragon "$pkgdir/usr/bin"
}

