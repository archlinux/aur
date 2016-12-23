# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

# TODO: Add icon(s)

pkgname=riot-web
pkgver=0.9.4
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=("any")
license=("Apache")
source=("git+https://github.com/vector-im/riot-web.git#tag=v$pkgver"
        "Riot.desktop"
        "riot-web.sh")
url="https://riot.im/"
makedepends=("git")
depends=("electron")
sha512sums=('SKIP'
            'd76be71d1ee0673916bfb563b1701ce42221ebd0fb520b5171d453027391b583eaebba4baee707eecd5583b461bc1317a67e4dd57fd350e134b1afd4fc5d4ed5'
            '48ec620b07fc57de790abdb1f01048825fa7864d22d3f3494055b3919538868ac9c48048d94ad1655f93da595cc1a06a625170aa070979f98a9d39b5ded34cae')

build() {
  cd $srcdir/riot-web
  npm install
  npm run build
}

package() {
  cd $srcdir/riot-web
  mkdir -p $pkgdir/usr/lib/$pkgname/{webapp,electron}

  #cp -r $srcdir/riot-web/* $pkgdir/usr/lib/$pkgname/
  cp $srcdir/riot-web/package.json $pkgdir/usr/lib/$pkgname/
  cp -r $srcdir/riot-web/webapp/* $pkgdir/usr/lib/$pkgname/webapp/
  cp -r $srcdir/riot-web/electron/* $pkgdir/usr/lib/$pkgname/electron/

  install -Dm644 $srcdir/Riot.desktop $pkgdir/usr/share/applications/Riot.desktop
  install -Dm755 $srcdir/riot-web.sh $pkgdir/usr/bin/riot-web
}

# vim:set ts=2 sw=2 et:
