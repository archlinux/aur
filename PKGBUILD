# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxls-git
_pkgname=nxls
pkgver=0.99
pkgrel=1
pkgdesc="Session daemon for NX"
url="https://git.weitnahbei.de/nullmark/nxls"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib')
optdepends=('nxinit: Session initialiastion')
makedepends=('git')
provides=('nxls')
conflicts=('nxls')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxls")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  git submodule init
  git submodule update
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
