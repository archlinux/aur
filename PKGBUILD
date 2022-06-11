# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-amqp-rabbitmq
pkgver="2.40010"
pkgrel='1'
pkgdesc="interact with RabbitMQ over AMQP using librabbitmq"
arch=("any")
license=('MPL')
url="https://metacpan.org/pod/Net::AMQP::RabbitMQ"
options=(!emptydirs)
depends=('perl-math-int64>=0.34')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTEMLE/Net-AMQP-RabbitMQ-${pkgver}.tar.gz")
sha512sums=('1e0256a3903379031059723ca0d11182ed4ef5a4ae4053d47f57ae1d4c5f42b3a9c48b7fd3dceb057c492c179bc01484651bb063fb5bca4542185fdca7471b06')

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
