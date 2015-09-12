# Previous Packager: AUR Perl <aurperl at juster dot info>
# Previous Packager: Kent Fredric <kentnl at cpan dot org>
# Maintainer: Cyril Bur

pkgname=perl-io-tiecombine
pkgver=1.004
pkgrel=1
pkgdesc="produce tied (and other) separate but combined variables"
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl')
url=https://metacpan.org/release/IO-TieCombine
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/IO-TieCombine-${pkgver}.tar.gz")
md5sums=('c36ad78c5787e064f94d8a3018193432')
sha512sums=('ffa69d2c7f0b72c56814dc5f1a54ac2b2d5827ff8646d248775a90c86f0c6b46d18dc3b95ca86d55dd48ead8b73d9caf6963ba66f75a2cb0eca3db30e5fee0e6')
_pkg_dir="IO-TieCombine"

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkg_dir}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" HARNESS_OPTIONS=j10
    cd "${srcdir}/${_pkg_dir}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${_pkg_dir}-${pkgver}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir" -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
