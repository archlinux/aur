# Maintainer: Devin Christensen <quixoten at gmail dot com>
pkgname=terminess-powerline-font-git
pkgver=r71.39c99c0
pkgrel=1
pkgdesc="Terminess Powerline"
arch=('any')
url=('https://github.com/powerline/fonts')
license=('custom:SIL Open Font License, Version 1.1')
depends=(fontconfig xorg-font-utils )
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
install=$pkgname.install
source=('git://github.com/powerline/fonts.git')
md5sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/Terminus
  find . -iname '*.pcf.gz' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/misc/{} \;
  find . -iname '*.psf.gz' -execdir install -Dm644 {} $pkgdir/usr/share/kbd/consolefonts/{} \;
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
