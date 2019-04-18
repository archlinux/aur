# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=libolm
_pkgname=olm
pkgver=3.0.0
pkgrel=1
pkgdesc='An implementation of the Double Ratchet cryptographic ratchet in C++'
arch=('x86_64' 'i686' 'armv7h')
url="https://git.matrix.org/git/olm/about/"
license=('Apache')
depends=('gcc-libs')
source=("https://gitlab.matrix.org/matrix-org/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha512sums=('4d83d7222f9fbc238a97156e4d22a6215e922c3e2567751b84243fb5081a9dd20d176fc7f187ccf92139a8fd7f36e851785def7fd448374c971964e4ba674dd6')

build() {
  cd "$_pkgname-$pkgver"
  # TODO: Switch build process to CMake as recommended by upstream
  make
}

check() {
  cd "$_pkgname-$pkgver"
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  make test
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sts=2 sw=2 et:
