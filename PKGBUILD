# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geiser-git
pkgver=0.10.14.geaaf40d
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
_gitname="geiser"
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd $_gitname
  git describe --tags | tr - .
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
