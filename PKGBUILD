
# Maintainer: Morten Linderud <morten@linderud.pw> 
pkgname=nerd-fonts-git
pkgver=r549.c89aeaa7
pkgrel=1
pkgdesc="collection of over 20 patched fonts (over 1,700 variations) & fontforge font patcher python script for powerline, devicons, and vim-devicons: includes Droid Sans, Meslo, AnonymousPro, ProFont, Inconsolta, and many more "
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=(fontconfig xorg-font-utils )
makedepends=('git')
conflicts=()
install=$pkgname.install
source=('git://github.com/ryanoasis/nerd-fonts.git')
#source=('./nerd-fonts')
md5sums=('SKIP')

pkgver() {
  cd nerd-fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/nerd-fonts/patched-fonts
  find . -iname "*.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  find . -iname "*.otf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  find . -iname "*.pcf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/misc/{} \;
  find . -iname "*.psf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/kbd/consolefonts/{} \;
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
