# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.67.11.ga7f8b05
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

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's|[-_]|.|g' | cut -c9-
}

build() {
  cd ${pkgname%-git}
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX="$pkgdir/" install
}
