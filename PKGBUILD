# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=emacs-pure-mode
pkgver=0.68
pkgrel=1
pkgdesc="An Emacs major mode for the Pure programming language"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
makedepends=('llvm35')
depends=("emacs" "flycheck" "pure")
groups=(pure-complete pure-base)
source=("https://github.com/agraef/pure-lang/releases/download/pure-$pkgver/pure-$pkgver.tar.gz"
	"pure-mode.patch")
md5sums=('082d522d05e58e55dc8094ba4c3d3eda'
         '8495eceda7b0238dd493b3a6cd54d606')

prepare() {
    cd pure-$pkgver
    patch -Np2 -i "${srcdir}/pure-mode.patch"
}

build() {
  cd pure-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd pure-$pkgver
  make DESTDIR=$pkgdir install-el install-elc
}
