# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.68.r16.g949c09e
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files - from git-repo"
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin' 'glibc')
makedepends=('git' 'texlive-core')
provides=('bibtool')
conflicts=('bibtool')
source=("git+https://github.com/ge-ne/bibtool")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c9- | tr _ . | sed 's+-+.r+' | tr - .
}

build() {
  cd ${pkgname%-git}
  autoreconf
  ./configure --prefix=/usr
  make all doc
}

package() {
  cd ${pkgname%-git}
  make INSTALLPREFIX="$pkgdir/" install
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cd doc
  for _i in *.pdf
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/doc/$pkgname/${_i}
  done
}
