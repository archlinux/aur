# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=riot-web
pkgver=0.9.5
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the desktop."
arch=("any")
license=("Apache")
source=("git+https://github.com/vector-im/riot-web.git#tag=v$pkgver"
#source=("https://github.com/vector-im/riot-web/releases/download/v0.9.5/vector-v0.9.5.tar.gz"{,.asc}
        "Riot.desktop"
        "riot-web.sh"
        "riot.svg"
        "riot.png")
#validpgpkeys=('6FEB6F83D48B93547E7DFEDEE019645248E8F4A1')
url="https://riot.im/"
makedepends=("git" "npm")
depends=("electron")
sha512sums=('SKIP'
            '103e08dd228967f75bf7f7a84d8764afdc7e88b3eb8d833e909ee8ca56bed3c451b7297c733de1459f37f1d9f50a3f9859879298ebfe92befe44c0785be7903c'
            '48ec620b07fc57de790abdb1f01048825fa7864d22d3f3494055b3919538868ac9c48048d94ad1655f93da595cc1a06a625170aa070979f98a9d39b5ded34cae'
            'bf88f617f7327b73e10d452c4f316f39e999874c25c6eac124036a28508c9ecadcc15e9540c4297903f1bac88cc580c48f69220c455369a8a21eef688071966b'
            '9bc5c155384bb6d17c9007e9fb17c644db0b86e7c4ca03396d845bdc2916ddf906570bdeca9133d6f09e6920531e742aed31738b4ad77196fdd48e54784d50cf')

build() {
#  cd $srcdir/vector-v$pkgver
  cd $srcdir/riot-web
  npm install
  npm run build
}

package() {
#  cd $srcdir/vector-v$pkgver
  cd $srcdir/riot-web
  mkdir -p $pkgdir/usr/lib/$pkgname/{webapp,electron}

  #cp -r $srcdir/riot-web/* $pkgdir/usr/lib/$pkgname/
  cp $srcdir/riot-web/package.json $pkgdir/usr/lib/$pkgname/
  cp -r $srcdir/riot-web/webapp/* $pkgdir/usr/lib/$pkgname/webapp/
  cp -r $srcdir/riot-web/electron/* $pkgdir/usr/lib/$pkgname/electron/

  install -Dm644 $srcdir/Riot.desktop $pkgdir/usr/share/applications/Riot.desktop
  install -Dm755 $srcdir/riot-web.sh $pkgdir/usr/bin/riot-web

  install -Dm644 $srcdir/riot.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/riot.svg
  install -Dm644 $srcdir/riot.png $pkgdir/usr/share/pixmaps/riot.png
}

# vim:set ts=2 sw=2 et:
