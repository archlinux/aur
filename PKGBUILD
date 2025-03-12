# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-amqp-rabbitmq
pkgver="2.40014"
pkgrel='2'
pkgdesc="interact with RabbitMQ over AMQP using librabbitmq"
arch=("any")
license=('MIT' 'MPL-1.1')
url="https://metacpan.org/pod/Net::AMQP::RabbitMQ"
options=(!emptydirs)
depends=('perl-math-int64>=0.34' 'perl-scalar-list-utils')
makedepends=('perl-devel-checklib')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTEMLE/Net-AMQP-RabbitMQ-${pkgver}.tar.gz")
sha512sums=('55c12151530221bbeb306d2d6ae34e275fbdb5895277f891da8f5a00584e674a183bdb1c1481d055cfcc08d64ad9d7b345595c47b7c5bd80f3b2a9562b0fec55')

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
