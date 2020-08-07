# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.68.r14.g43de68a
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files - from git-repo"
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin' 'glibc')
makedepends=('git')
provides=('bibtool')
conflicts=('bibtool')
source=("git+https://github.com/ge-ne/bibtool")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c9- | tr _ . | sed 's+-+.r+' | tr - .
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
