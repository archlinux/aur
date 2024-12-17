# Maintainer: freggel.doe <freggel.doe@gmx.net>

# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-crypt-urandom
_cpanname=Crypt-URandom
pkgver=0.40
pkgrel=1
pkgdesc="Provide non blocking randomness"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod')
url="https://metacpan.org/release/$_cpanname"
source=("http://search.cpan.org/CPAN/authors/id/D/DD/DDICK/$_cpanname-$pkgver.tar.gz")
md5sums=('4ecfd3776faf0b3eb2bef2a886a88843')
sha512sums=('2cf332148f46599388438b4aa8d47ec7da1f8cf5b8b59cc6ca41477b39fc0f0b957a643dc0c539b353c4296775ec0faf2a9bb2217ed71b76a476f68520d4cf0f')

build() {
    cd "$srcdir/$_cpanname-$pkgver"
    (
        export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                   \
            PERL_AUTOINSTALL=--skipdeps                            \
            PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
            MODULEBUILDRC=/dev/null

        /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
        make
    )
}

check() {
    cd "$srcdir/$_cpanname-$pkgver"
    PERL_MM_USE_DEFAULT=1 PERL5LIB="" make test
}

package() {
    cd "$srcdir/$_cpanname-$pkgver"
    make install
}

# vim:set ts=4 sw=4 expandtab:
