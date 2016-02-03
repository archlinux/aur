# Maintainer: Devin Christensen <quixoten at gmail dot com>
pkgname=ttf-dejavu-sans-mono-powerline-git
pkgver=r100.a44abd0
pkgrel=2
pkgdesc="DejaVu Sans Mono for Powerline"
arch=('any')
url='https://github.com/powerline/fonts'
license=('custom:DejaVu Fonts License, Version 1.0')
depends=(fontconfig xorg-font-utils )
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
install=$pkgname.install
source=('git+https://github.com/powerline/fonts.git')
md5sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/DejaVuSansMono
  find . -iname '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
