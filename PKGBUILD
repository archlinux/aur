# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: acounto <acounto@kamikakushi.net>

pkgname=b25-stz-git
pkgver=0.2.5
pkgrel=1
pkgdesc="ARIB25 test program and library (modified by stz2012)"
groups=('earthsoft')
arch=('i686' 'x86_64')
url="http://hg.honeyplanet.jp/pt1/"
license=('custom')
provides=('b25')
conflicts=('b25')
depends=('pcsclite')
optdepends=('recpt1-stz-git: Earthsoft PT-Series controller')
source=('git+https://github.com/stz2012/libarib25.git'
        'Makefile.patch')
md5sums=('SKIP'
         'e0d04b07c8187bd9fc3b144215591cbd')

prepare() {
  cd libarib25
  patch -Np2 < ../Makefile.patch
}

build() {
  cd libarib25/src
  make PREFIX=/usr
}

package() {
  cd libarib25/src
  mkdir -p ${pkgdir}/usr/{lib,bin}
  make PREFIX="${pkgdir}/usr" install
  make PREFIX="${pkgdir}/usr" install-headers
}
