# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=voadi-git
pkgver=0.3.r423.gec6fefd
pkgrel=2
pkgdesc='Vegan on a Desert Island: 2D adventure game about being a vegan on a desert island (Git version)'
arch=('any')
url='https://voadi.com'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
makedepends=('git')
source=("voadi-git::git+https://gitlab.com/voadi/voadi.git"
        "$pkgname-launcher"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('SKIP'
        'b66cf678a4ec653e30daec021319a267abd9f1e8a4cd86adf2e5d88c87c135a264951a3ccd831ff9b84712281c0dbc827a086a1432b928baf9885b2c2c20ebad'
        '4028dbfe88e2dcfcdb61fa0f114a40fb590ccd954054ecace0900548428000f918a514905397a90479636d5044a7e73bcc3f4124fa5baeecefe4c59a59add109'
        '8a9dbcef305d4e14e50734e5cf8e25d0cb8245f70eec0aabc6a3f9c4fe2e58d4b03e20016ef59a765dd43a183da79b2cc2f650f4df5faa87a5dd9364101c855d')

pkgver() {
  cd "voadi-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm 755 "$pkgname-launcher" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  cd "voadi-git"

  install -dm755 "$pkgdir/usr/share/solarus"
  cp -r data "$pkgdir/usr/share/solarus/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 attributions.txt "$pkgdir/usr/share/licenses/$pkgname/ATTRIBUTIONS"
}
