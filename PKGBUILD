# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtool
pkgver=2.59
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files."
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin')
makedepends=('tar')
source=(http://www.gerd-neugebauer.de/software/TeX/BibTool/BibTool-$pkgver.tar.gz)
md5sums=('78b892f21ddbd803ac74badffc41a6d3')
noextract=("BibTool-$pkgver.tar.gz")

prepare() {
  # bsdtar has strange problems unpackung this, so let's use gnu tar 
  tar xf BibTool-$pkgver.tar.gz
}

build() {
  cd "$srcdir/BibTool"
  autoreconf
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/BibTool"
  install -d "$pkgdir"/usr/bin
  make INSTALLPREFIX=$pkgdir install 
}
