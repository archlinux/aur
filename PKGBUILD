# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geiser-git
pkgver=0.10.r87.g846b23d
pkgrel=1
pkgdesc="Emacs environment to hack in Scheme, version from git"
arch=('any')
url=http://www.nongnu.org/geiser/
license=('custom:BSD')
depends=('bash' 'emacs')
makedepends=('git')
provides=('geiser')
conflicts=('geiser')
source=("git://git.sv.gnu.org/geiser.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+'| tr - .
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh 
  [[ -d build ]] || mkdir build
  cd build 
  ../configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
