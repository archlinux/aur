# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=perl-xml-dom-xpath
pkgname_=XML-DOM-XPath
pkgver=0.14
pkgrel=5
pkgdesc="Implements Level 1 of W3's DOM: XPath"
arch=('any')
url="http://search.cpan.org/~mirod/XML-DOM-XPath-0.14/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-xml-regexp' 'libxml-perl>=0.07' 'perl-libwww' 'perl-xml-dom')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/XML-DOM-XPath-${pkgver}.tar.gz)
md5sums=('51a40df96c2f92829e1a4f84782fa75e')

build() {
  cd ${srcdir}/${pkgname_}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd ${srcdir}/${pkgname_}-${pkgver}
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
  _perl_depends
}
