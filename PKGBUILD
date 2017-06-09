# CPAN Name : JSON::RPC::Common
# Maintainer: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-json-rpc-common
_pkgname='JSON-RPC-Common'
pkgver=0.11
pkgrel=2
pkgdesc="Perl module provide transport agnostic JSON RPC helper objects"
arch=("any")
url="https://metacpan.org/pod/JSON::RPC::Common"
license=("PerlArtistic")
depends=("perl>=5.6.2"
         "perl-class-load"
         "perl-http-message"
         "perl-json"
         "perl-moose"
         "perl-moosex-types"
         "perl-mro-compat"
         "perl-namespace-clean"
         "perl-try-tiny"
         "perl-uri"
)
source=(https://cpan.metacpan.org/authors/id/D/DM/DMCBRIDE/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('ebb140b4b0b1936e76da04f3d8be998e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
