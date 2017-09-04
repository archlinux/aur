
# Maintainer: Morten Linderud <morten@linderud.pw> 
pkgname=nerd-fonts-git
pkgver=r549.c89aeaa7
pkgrel=1
pkgdesc="Iconic font aggregator, collection, and patcher: 34 patched fonts (77k+ variations). Includes popular glyph collections such as Font Awesome & fonts such as Hack"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
makedepends=('git')
source=('git+https://github.com/ryanoasis/nerd-fonts.git')
md5sums=('SKIP')

pkgver() {
  cd nerd-fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/nerd-fonts/patched-fonts"
  find . -iname "*.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
  find . -iname "*.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.pcf.gz" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/misc/{}" \;
  find . -iname "*.psf.gz" -execdir install -Dm644 {} "$pkgdir/usr/share/kbd/consolefonts/{}" \;
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
