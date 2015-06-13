# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-moo'
pkgver='2.000001'
pkgrel="1"
pkgdesc="Minimalist Object Orientation (with Moose compatiblity)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-method-modifiers>=1.1' 'perl-devel-globaldestruction>=0.11' 'perl-import-into>=1.002' 'perl-module-runtime>=0.014' 'perl-role-tiny>=2')
makedepends=('perl-test-fatal>=-0.003')
url='https://metacpan.org/release/Moo'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Moo-${pkgver}.tar.gz")
md5sums=('61cfeb965736736e7c5687a28d097ac0')
sha512sums=('e2261239ab60ab62058d4e57db92e3d6d7f93a22dd98589c7a392e213c5a653957bfdb9582bfd54dd3880553dfe8573e025ff799fdf9803df465a4303d59a62b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Moo-${pkgver}"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
