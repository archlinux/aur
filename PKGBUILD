# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com.

pkgname='perl-class-std-fast'
pkgver=0.0.8
pkgrel=3
pkgdesc='A faster but less secure Class::Std'
arch=('any')
url='https://metacpan.org/pod/Class::Std::Fast'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl-class-std')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/A/AC/ACID/Class-Std-Fast-v${pkgver}.tar.gz")
sha256sums=('1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780')

build() {
    cd Class-Std-Fast-v${pkgver}

    export PERL_MM_USE_DEFAULT=1 \
           PERL5LIB="" \
           PERL_AUTOINSTALL=--skipdeps \
           PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
           PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
           MODULEBUILDRC=/dev/null

    perl Makefile.PL
    make
}

check() {
    cd Class-Std-Fast-v${pkgver}
    make test
}

package() {
    cd Class-Std-Fast-v${pkgver}

    make install
    find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
