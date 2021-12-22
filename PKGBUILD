# Maintainer: Sean Anderson <seanga2@gmail.com>

pkgname=dh-golang
pkgver=1.53
pkgrel=1
pkgdesc="debhelper add-on for packaging software written in Go"
arch=('any')
url="https://salsa.debian.org/go-team/packages/dh-golang"
license=('GPL')
groups=()
depends=('perl>=5.10.0' debhelper dpkg)
makedepends=(perl-module-install)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$url/-/archive/debian/$pkgver/$pkgname-debian-$pkgver.tar.bz2")
sha512sums=('c17496c68c48e6d792bfef9d83aeb147be3f5cfc9e28ff746dbe584983905257925483a7323eb72a1119abc48a7a13fe114e82b9c2f55772c4a3379d8f3d5d51')

build() {
  cd "$srcdir/$pkgname-debian-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-debian-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
