# Maintainer: Chris Lane <aur at chrislane dot com>

pkgname=scrot-slabua-git
pkgver=0.8.26.r23.g1428323
pkgrel=1
pkgdesc='Simple command-line screenshot utility for X - Slabua fork'
url='https://github.com/slabua/scrot'
arch=('any')
license=('MIT')
depends=('giblib')
makedepends=('git')
conflicts=('scrot')
provides=('scrot')
source=("$pkgname"::"git+https://github.com/slabua/scrot")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^scrot-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=${pkgdir} docsdir=/usr/share/doc/scrot install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh ts=2 sw=2 et
