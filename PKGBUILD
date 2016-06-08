# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=svg-cleaner-git
pkgver=v0.6.2.27.gb827305
pkgrel=5
pkgdesc="Program for reducing size of svg images without loss"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/svgcleaner/"
license=('GPL3')
depends=('qt4' 'gtk-update-icon-cache')
makedepends=('git')
source=('git+https://github.com/RazrFalcon/SVGCleaner.git')
md5sums=('SKIP')
_gitname="SVGCleaner"

pkgver() {
  cd "$srcdir"/"$_gitname"
    printf "%s" "$(git describe --tags|tr - .)"
}

build() {
  cd "$srcdir"/"$_gitname"
  qmake-qt4
  make 
}

package() {
  cd "$srcdir"/"$_gitname"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm755 bin/svgcleaner-cli "$pkgdir"/usr/bin/svgcleaner-cli
  install -Dm755 bin/svgcleaner-gui "$pkgdir"/usr/bin/svgcleaner-gui
}
