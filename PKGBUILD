# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Morten Linderud <morten@linderud.pw> 
pkgname=nerd-fonts-git
pkgver=2.1.0.r150.g38f76ec6
pkgrel=1
pkgdesc="Iconic font aggregator, collection, and patcher: 34 patched fonts (77k+ variations). Includes popular glyph collections such as Font Awesome & fonts such as Hack"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
makedepends=('git')
conflicts=('nerd-fonts' 'ttf-iosevka-nerd')
provides=('nerd-fonts')
source=('git+https://github.com/ryanoasis/nerd-fonts.git')
sha256sums=('SKIP')

pkgver() {
  cd nerd-fonts
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

package() {
  cd "$srcdir/nerd-fonts/patched-fonts"
  find . -iname "*.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
  find . -iname "*.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.pcf.gz" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/misc/{}" \;
  find . -iname "*.psf.gz" -execdir install -Dm644 {} "$pkgdir/usr/share/kbd/consolefonts/{}" \;
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
