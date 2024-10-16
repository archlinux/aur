# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-amqp-rabbitmq
pkgver="2.40013"
pkgrel='1'
pkgdesc="interact with RabbitMQ over AMQP using librabbitmq"
arch=("any")
license=('MPL')
url="https://metacpan.org/pod/Net::AMQP::RabbitMQ"
options=(!emptydirs)
depends=('perl-math-int64>=0.34' 'perl-scalar-list-utils')
makedepends=('perl-devel-checklib')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTEMLE/Net-AMQP-RabbitMQ-${pkgver}.tar.gz")
sha512sums=('05ccef23026a02f9e6e7153e2b08b32809478e098a95376b169c1f1162e6adf3f6c032a30f08e85a59c82ab4c7034b03e7c8b71a023055b3270af12194d6856b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Net-AMQP-RabbitMQ-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
