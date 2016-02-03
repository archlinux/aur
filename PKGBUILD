# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.63.55.gaf3a9d2
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files - from git-repo"
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin')
makedepends=('git')
provides=('bibtool')
conflicts=('bibtool')
source=("git+https://github.com/ge-ne/bibtool#commit=af3a9d2ca5709e5638c2ec84dfbe034ebad016c7")
md5sums=('SKIP')
options=('!makeflags')
_gitname="bibtool"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|[-_]|.|g' | cut -c9-
}

build() {
  cd "$srcdir"/"$_gitname"
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX="$pkgdir/" install
}
