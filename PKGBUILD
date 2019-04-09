pkgname=llgal
pkgver=0.13.19
pkgrel=1
pkgdesc="On-line gallery generator based on iGal"
arch=('x86_64')
url="http://bgoglin.free.fr/llgal/"
license=('GPL')
depends=('perl' 'perl-image-size' 'perl-locale-gettext')
options=(!emptydirs)
source=(https://github.com/bgoglin/llgal/archive/$pkgname-$pkgver.tar.gz)
md5sums=('20e25ef3cf1d969caf1549a888092014')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

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
