# Maintainer: Kyle Keen < keenerd at gmail >

pkgname=ttf-game-fonts
pkgver=20111126
pkgrel=3
pkgdesc='Some +200 fonts from classic video games.'
arch=('any')
license=('custom')
url='http://www.thealmightyguru.com/GameFonts/Index.html'
depends=('xorg-font-utils' 'fontconfig')
makedepends=('wget' 'unzip')
install=ttf-game-fonts.install
source=()
_download_source='http://www.thealmightyguru.com/GameFonts/GFD-FontList.html'
md5sums=()

build() {
  msg "Beginning dynamic build..."
  mkdir -p zips
  wget -r -l 1 -N -L -np -nd -nH -P "./zips" -A "Font*.zip" "$_download_source" || true
  #cp ../zips/*.zip zips/
}

package() {
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  for z in zips/*.zip; do
    unzip -j "$z" '*.ttf' -d "$pkgdir/usr/share/fonts/TTF/" 2> /dev/null || true
    unzip -j "$z" '*.txt' '*.html' '*.doc' -d "$pkgdir/usr/share/licenses/$pkgname/" 2> /dev/null || true
  done
  chmod -R a+r "$pkgdir/usr/share/fonts/TTF/"
  chmod -R a+r "$pkgdir/usr/share/licenses/$pkgname/"
}

