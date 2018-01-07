# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: trizen .= x@gmail.com

pkgname=perl-xml-fast
pkgver=0.11
pkgrel=10
pkgdesc="Simple and very fast XML to hash conversion."
arch=('x86_64')
url="http://search.cpan.org/dist/XML-Fast/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MO/MONS/XML-Fast-${pkgver}.tar.gz")
md5sums=('a2985cc2f328cf9eda6ad75c3f40f6b3')

build() {
  cd "${srcdir}/XML-Fast-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd "${srcdir}/XML-Fast-${pkgver}"

  make DESTDIR="${pkgdir}" install

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete

# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
