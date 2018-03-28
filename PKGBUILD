# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=nerd-fonts-ricty
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched font Ricty from nerd-fonts library"
arch=('any')
url="http://www.rs.tus.ac.jp/yyusa/ricty.html"
license=('custom')
makedepends=('ttf-ricty' 'fontforge' 'perl-rename')
install=$pkgname.install
source=("nerd-fonts-$pkgver.tar.gz"::"https://github.com/ryanoasis/nerd-fonts/archive/$pkgver.tar.gz")
sha256sums=('7095b5b2ffe62a49dca18c681ac8cbd64c4c3585995bc175dee4be01aee0edd9')

build() {
  cd "$srcdir/nerd-fonts-$pkgver"
  for i in /usr/share/fonts/TTF/{Ricty,RictyDiscord}-{Bold,BoldOblique,Oblique,Regular}.ttf; do
    ./font-patcher -c $i
  done
  perl-rename "s/ /-/g" *.ttf

  cd "$srcdir"
  touch "LICENSE"
}

package() {
  cd "$srcdir/nerd-fonts-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/" 
}
