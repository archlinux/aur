# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>

pkgname=voadi-git
pkgver=0.3.r423.gec6fefd
pkgrel=1
pkgdesc='Vegan on a Desert Island: 2D adventure game about being a vegan on a desert island (git version)'
arch=('any')
url='https://voadi.com'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
source=("voadi-git::git+https://gitlab.com/voadi/voadi.git"
        "$pkgname-launcher")
b2sums=('SKIP'
        'b66cf678a4ec653e30daec021319a267abd9f1e8a4cd86adf2e5d88c87c135a264951a3ccd831ff9b84712281c0dbc827a086a1432b928baf9885b2c2c20ebad')

pkgver() {
  cd "voadi-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm 755 "$pkgname-launcher" "$pkgdir/usr/bin/$pkgname"

  cd "voadi-git"

  install -dm755 "$pkgdir/usr/share/solarus"
  cp -r data "$pkgdir/usr/share/solarus/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 attributions.txt "$pkgdir/usr/share/licenses/$pkgname/ATTRIBUTIONS"
}
