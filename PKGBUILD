# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-mojolicious-plugin-i18n'
pkgver='1.6'
pkgrel='2'
pkgdesc="Internationalization Plugin for Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

depends=(
  'perl'
  'perl-mojolicious>=4.0'
)
checkdepens=()
makedepends=()
url='https://metacpan.org/pod/Mojolicious::Plugin::I18N'
source=('https://cpan.metacpan.org/authors/id/S/SH/SHARIFULN/Mojolicious-Plugin-I18N-1.6.tar.gz')
md5sums=('4002f7a7da4c90973ad6eedfb0fcfa16')
sha512sums=('9915d106699eec534d440add20e6138876ac6eb2408217a19a027706950fd18d0d46c5daef31e3446be5d748098b10c81a2c4b3ababc3c5bd5964e5177c1c831')
_distdir="Mojolicious-Plugin-I18N-1.6"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
