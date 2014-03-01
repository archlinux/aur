# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=cannonball
pkgver=0.22
pkgrel=1
pkgdesc='Enhanced OutRun Engine'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl' 'bash')
makedepends=('cmake' 'boost')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/djyt/cannonball/archive/v$pkgver.tar.gz"
        "$pkgname.sh")
md5sums=('27b0a94bc9330ab529df8404f3b476fa'
         '06ea516bc9a4454da988074465e25943')

prepare() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake ../cmake -DTARGET=debian
  make
}

package() {
  cd $pkgname-$pkgver

  # launcher + binary
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/$pkgname "$pkgdir"/usr/lib/$pkgname/$pkgname
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/$pkgname/config.xml
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
