# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=thrash-protect-git
pkgver=0.13.0.r20.g4fe542e
pkgrel=1
pkgdesc='Program causing graceful degradation rather than thrashing on heavy swap usage.'
url='https://github.com/tobixen/thrash-protect'
arch=('any')
license=('GPL')
makedepends=('git')
depends=('python')
source=("$pkgname::git+https://github.com/tobixen/thrash-protect#branch=master")
md5sums=('SKIP')
conflicts=('thrash-protect')
provides=('thrash-protect')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "$pkgdir/usr/bin/" "$pkgdir/usr/sbin"
  cd "$srcdir/$pkgname/"
  make PREFIX=$pkgdir/usr INSTALL_ROOT=$pkgdir install
  rm "$pkgdir/usr/sbin"
}

