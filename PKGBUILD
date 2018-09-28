# Submitter: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>

_pkgname=olm
pkgname=libolm
pkgver=2.3.0
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('i686' 'x86_64' 'armv7h')
url="https://matrix.org/git/olm/"
license=('Apache')
depends=('gcc-libs')
source=("https://matrix.org/git/$_pkgname/snapshot/$_pkgname-$pkgver.tar.bz2")
sha256sums=('77d6d3d03c5cb9a866825fee1d684f491d4772835a858cd16e0a8e9f67dfbb8b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  make test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sts=2 sw=2 et:
