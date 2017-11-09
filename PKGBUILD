# Maintainer: Nicolas Quiénot <niQo @ aur>
pkgname=miio
pkgver=0.14.0
pkgrel=1
pkgdesc="Control Mi Home devices, such as Mi Robot Vacuums, Mi Air Purifiers, Mi Smart Home Gateway (Aqara) and more"
arch=('any')
url="https://github.com/aholstenson/miio"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("https://github.com/aholstenson/miio/archive/$pkgver.tar.gz")
sha256sums=('d7c2cc22d54801e5852cd16e4e6e033d7d074c126e3d5e13ea1a2c9ce2e8ea85')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  #HACK to remove created symlink
  rm $pkgdir/usr/lib/node_modules/miio
  mkdir -p $pkgdir/usr/lib/node_modules/miio
  cp -r * $pkgdir/usr/lib/node_modules/miio/
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}

