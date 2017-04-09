pkgname=locator
pkgdesc="Unix command "locate" front-end. A Linux alternative to voidtool's "Everything", written in Lazarus."
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/AlexTuduran/Locator"
license=('custom:Completely free')
depends=('mlocate' 'gksu')
makedepends=('lazarus' 'imagemagick' 'gendesk')
source=("$pkgname-$pkgver-alpha.tar.gz::https://github.com/AlexTuduran/Locator/archive/v$pkgver-alpha.tar.gz")
sha256sums=('456f5542e025c387b8097e4a776c309998eb24c249f523b604c116bb3d16d94d')

prepare() {
  cd Locator-$pkgver-alpha
  convert locator.ico locator.png
  gendesk -f -n --pkgname=$pkgname --exec="gksudo locator"
}

build() {
  cd Locator-$pkgver-alpha
  lazbuild locator.lpr --lazarusdir=/usr/lib/lazarus
}

package() {
  cd Locator-$pkgver-alpha
  install -Dm755 _.bin/locator  "$pkgdir"/usr/bin/locator
  install -Dm644 locator.png "$pkgdir"/usr/share/pixmaps/locator.png
  install -Dm644 locator.desktop "$pkgdir"/usr/share/applications/locator.desktop
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
