# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
pkgname=llgal
pkgver=0.13.18
pkgrel=1
pkgdesc="On-line gallery generator based on iGal"
arch=('i686' 'x86_64')
url="http://home.gna.org/llgal/"
license=('GPL')
depends=('perl' 'perl-image-size' 'perl-locale-gettext')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://download.gna.org/llgal/$pkgname-$pkgver.tar.bz2)
md5sums=('160f03cfb34012bc240f0c8314edbd00')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/\/usr\/local/\/usr/g' Makefile
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1
  make install-man DESTDIR="$pkgdir/" || return 1
  make install-doc DOCDIR="$pkgdir/usr/share/doc/llgal" || return 1


  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
