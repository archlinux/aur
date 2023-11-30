# Maintainer: Stefan Mark <mark at unserver dot de>

pkgname=nxextra-git
_pkgname=nxextra
pkgver=0.99
pkgrel=1
pkgdesc="Base helpers for NX"
url="https://git.weitnahbei.de/nullmark/nxextra"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nxlib' 'libx11')
makedepends=('git')
provides=('nxextra')
conflicts=('nxextra')
source=("$_pkgname::git+http://git.weitnahbei.de/nullmark/nxextra")
sha256sums=('SKIP')

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin/nxaabat" "$pkgdir/usr/sbin/nxpm" "$pkgdir/usr/sbin/nxsuspend" "$pkgdir/usr/sbin/nxsysdaemon" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
