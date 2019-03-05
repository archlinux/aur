# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=auctex-git
pkgver=12.1.161.g78c0f096
pkgrel=1
pkgdesc="TeX/LaTeX writing environment for Emacs - git checkout"
arch=('any')
url="http://savannah.gnu.org/projects/auctex"
license=('GPL3')
depends=('texlive-core' 'emacs')
makedepends=('git' 'texinfo' 'perl')
provides=('auctex')
conflicts=('auctex')
install=auctex.install
source=('git://git.sv.gnu.org/auctex.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c9- | sed 's+[_-]+.+g'
}

prepare() {
  cd ${pkgname%-git}
  cp ChangeLog.1 ChangeLog
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --localstatedir=/var \
	      --with-texmf-dir=$(dirname $(kpsewhich texmf.cnf))
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/var/auctex
}
