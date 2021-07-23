# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Convert-Base32"
_modnamespace=Convert
pkgname=perl-convert-base32
pkgver=0.06
pkgrel=4
pkgdesc="Encoding and decoding of base32 strings"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
checkdepends=('perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('53cbbb171d86c04bdee85418a4040eb8b6dd3bd00db4d15907a0c4dfd2e55277eafae010a7c877b28dd90594f32d9ef1862f75218d059ec45e5fff6fe0bb98fd')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
