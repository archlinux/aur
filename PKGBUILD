# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=nerd-fonts-ricty
pkgver=2.0.0
pkgrel=2
pkgdesc="Japanese TrueType font for developers by mixing InconsolataGo patched nerd-fonts and Migu 1M."
arch=('any')
url="http://www.rs.tus.ac.jp/yyusa/ricty.html"
license=('custom')
makedepends=('fontforge' 'nerd-fonts-inconsolata-go' 'ttf-migu' 'perl-rename')
install=$pkgname.install
source=(
  'http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator-4.1.1.sh'
  'https://gist.githubusercontent.com/LaFr4nc3/70bb0526986953d32d7609d5486d822e/raw/feb7d6e47a849469b0ec455bef6ccfa231bce3d6/ricty_generator.patch'
)
sha256sums=(
  '86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d'
  '96f7acb2a875f5d33cf7aca1a40438a461a5f705865928250a17ed1cc4945cfd'
)

build() {
  cd "$srcdir"  
  patch -u --follow-symlinks ./ricty_generator-4.1.1.sh < ./ricty_generator.patch
  chmod +x ./ricty_generator-4.1.1.sh
  ./ricty_generator-4.1.1.sh /usr/share/fonts/TTF/{'InconsolataGo Nerd Font Complete.ttf','InconsolataGo Bold Nerd Font Complete.ttf',migu-1m-regular.ttf,migu-1m-bold.ttf}
  perl-rename "s/ /-/g" *.ttf
  touch "LICENSE"
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/" 
}
