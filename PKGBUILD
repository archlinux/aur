# Maintainer: Danil Doroshin <ddddanil5555 at gmail dot com>
pkgname=kwin-bismuth
pkgver=1.1.0
pkgrel=1
pkgdesc="KWin tiling extension, that gets you down to bismuth. Krohnkite fork"
arch=('any')
url="https://github.com/gikari/bismuth"
license=('MIT')
depends=('hicolor-icon-theme')
makedepends=('tar' 'unzip')
source=("bismuth.v$pkgver.tar.gz::$url/releases/download/v$pkgver/bismuth.tar.gz"
        "https://raw.githubusercontent.com/gikari/bismuth/master/LICENSES/MIT.txt")
sha256sums=('495f83b6aa7768bf0eb934c9476e0f629378a8d7f4e2098b024b82c2463b0f2a'
            'b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0')

prepare() {
  tar xf $srcdir/bismuth.v$pkgver.tar.gz --directory=$srcdir
}

package() {
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps/
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  mkdir -p $pkgdir/usr/share/kwin/scripts/bismuth/
  mkdir -p $pkgdir/usr/share/kservices5/

  install $srcdir/icons/bismuth.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bismuth.svg
  install $srcdir/MIT.txt $pkgdir/usr/share/licenses/$pkgname/
  unzip $srcdir/bismuth.kwinscript -d $pkgdir/usr/share/kwin/scripts/bismuth/
  find $pkgdir/usr/share/kwin/scripts/bismuth/ -exec chmod o-w {} \;
  install $pkgdir/usr/share/kwin/scripts/bismuth/metadata.desktop $pkgdir/usr/share/kservices5/bismuth.desktop
}

# vim:set ts=2 sw=2 et:
