# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.62
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files - from git-repo"
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin')
makedepends=('git')
provides=('bibtool')
conflicts=('bibtool')
source=("git+https://github.com/ge-ne/bibtool")
md5sums=('SKIP')
options=('!makeflags')
_gitname="bibtool"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|[-_]|.|g' | cut -c9-
}

build() {
  cd "$srcdir"/"$_gitname"
  sed -i '1,3d' include/bibtool/regex.h
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX="$pkgdir/" install
}
