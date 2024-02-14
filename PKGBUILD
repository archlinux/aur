# Contributor: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
# Contributor: Akshay Nair <phenax5@gmail.com>

pkgname=bsp-layout
pkgver=0.0.10
pkgrel=4
pkgdesc="Dynamic layout management for bspwm with tall, wide, even, tiled, monocle"
arch=('any')
url="https://github.com/phenax/bsp-layout"
license=('MIT')
depends=('bash' 'bc' 'bspwm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ec71dd3438ff84ab3dd6d72673500a33158937112e9fcf87c64b02313bc1c1c8')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's#{{SOURCE_PATH}}#/usr/lib/bsp-layout#' src/layout.sh
  sed -i 's#{{VERSION}}#'$pkgver'#' src/layout.sh bsp-layout.1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname/" src/layout.sh
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname/utils/" src/utils/*.sh
  install -Dm755 -t "$pkgdir/usr/lib/$pkgname/layouts/" src/layouts/*.sh
  install -Dm755 -t "$pkgdir/usr/share/man/man1" bsp-layout.1
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/layout.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
