# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=KJETILK
_dist=URI-NamespaceMap
pkgname=perl-${_dist@L}
pkgver=1.12
pkgrel=1
pkgdesc='Namespace manipulation and prefix mapping for XML, RDF, etc.'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-iri>=0.004'
    'perl-module-load-conditional'
    'perl-moo>=1.006000'
    'perl-namespace-autoclean>=0.20'
    'perl-sub-quote'
    'perl-try-tiny'
    'perl-type-tiny>=1.000000'
    'perl-types-uri>=0.004'
    'perl-uri>=1.52'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-test-deep'
    'perl-test-exception'
    'perl-test-requires'
    'perl-test-simple'
)
optdepends=(
    'perl-attean'
    'perl-rdf-ns'
    'perl-rdf-ns-curated'
    'perl-rdf-prefixes'
    'perl-rdf-trine'
    'perl-xml-commonns'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b05c3fb3cbcec9db925c039a0814ac4bcc2962e6b367d32fc339d79e9510e6b8')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
