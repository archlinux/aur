# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=doxymacs-git
pkgver=20230601
pkgrel=1
pkgdesc="Use Doxygen from within Emacs -- git version"
arch=('i686' 'x86_64')
url="https://github.com/pniedzielski/doxymacs"
license=('GPL2')
depends=('libxml2>=2.6.13')
makedepends=('git' 'texlive-latexextra')
provides=('doxymacs')
conflicts=('doxymacs')
install=doxymacs.install
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd ${pkgname%-git}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
