# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-validator'
pkgver='5.08'
pkgrel='1'
pkgdesc="Perl/CPAN Module JSON::Validator: Validate data against a JSON schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'perl-mojolicious>=7.28' 'perl-yaml-libyaml')
makedepends=()
optdepends=('perl-data-validate-ip: IPv4 and IPv6 validation'
            'perl-net-idn-encode: IDNs validation'
            'perl-data-validate-domain: Domain and host name validation')
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/JSON-Validator'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/JSON-Validator-$pkgver.tar.gz")
md5sums=('1536c7743349f28f07494d72e04b1a84')
sha512sums=('11ac58ffb69ac1460c7ab9d42c94ea5a1111a615c5560009a3f5e40c316229efd19abfca71a7989af8a573cef279aa7004cadef269faecaa51ceb3013bf8915e')
_distdir="JSON-Validator-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
