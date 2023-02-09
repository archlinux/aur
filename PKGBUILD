# Contributor: Bence Csókás <bence98  sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-marc-file-xml'
pkgver='1.0.5'
pkgrel='1'
pkgdesc="Work with MARC data encoded as XML "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-marc-charset>=0.98' 'perl-marc-record>=2' 'perl-xml-libxml>=1.66')
makedepends=()
checkdepends=('perl-test-warn>=0')
provides=('perl-marc-xml=1.0.5')
url='https://metacpan.org/release/MARC-File-XML'
source=('http://search.cpan.org/CPAN/authors/id/G/GM/GMCHARLT/MARC-File-XML-1.0.5.tar.gz' 'https://salsa.debian.org/perl-team/modules/packages/libmarc-xml-perl/-/raw/master/debian/patches/XML-LibXML-2.0202.patch')
md5sums=('44c5f6d4658a1a35624a58adb2575bb0' '40b6418ab98ac7c661c04a1e1fd00fa8')
sha512sums=('9a2ea2e3bb19a43cb4870cbc3a647c09ce02df91a91251e4646d7804efc47af45676c65ad4504ef7f16e49e2eae008866d0d72c69f8a684f079b8666ceb58dcc'
            'face7d1a1edb686d3a762dd099e518a579ba1fff36a6d38b4115c2697871ccb423b9bafa1461c54ff3c8361b3ec956dc3ea0869a4853543ec9e76db97bd2b298')
_distdir="MARC-File-XML-1.0.5"

prepare() {
    patch --directory="$srcdir/$_distdir" --forward --strip=1 --input="${srcdir}/XML-LibXML-2.0202.patch"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
