# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-amqp-rabbitmq
pkgver="2.40009"
pkgrel='1'
pkgdesc="interact with RabbitMQ over AMQP using librabbitmq"
arch=("any")
license=('MPL')
url="https://metacpan.org/pod/Net::AMQP::RabbitMQ"
options=(!emptydirs)
depends=('perl-math-int64>=0.34')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTEMLE/Net-AMQP-RabbitMQ-${pkgver}.tar.gz")
sha512sums=('2c0f53d59858e777fbc712c3bd06e3464783559dd9424c58a8fe586747e1d43aa4a607268484ec8bf4f10e979788ed5ea9558208096187c6e0c12a473e465459')

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
