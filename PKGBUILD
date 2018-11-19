# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geiser-git
pkgver=0.10.28.gdcf754c
pkgrel=1
pkgdesc="Emacs environment to hack in Scheme, version from git"
arch=('any')
url=http://www.nongnu.org/geiser/
license=('custom:BSD')
depends=('bash' 'emacs')
makedepends=('git')
provides=('geiser')
conflicts=('geiser')
source=("git+https://gitlab.com/jaor/geiser.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - .
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
