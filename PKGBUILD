# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=perl-yaml-merge-simple
_cpname=YAML-Merge-Simple
pkgver=0.01
_cpver=01
pkgrel=3
pkgdesc='Recursively merge two or more YAMLs, simply'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-hash-merge-simple' 'perl-yaml-libyaml' 'perl>=5.006')
makedepends=()
url="https://github.com/andrefs/$_cpname"
source=("https://cpan.metacpan.org/authors/id/A/AN/ANDREFS/$_cpname-${pkgver}_$_cpver.tar.gz")
sha256sums=('01ccfbd91b1ff3a3b1edd14f343cf61f6470c4036456a8bfa350eb211c9d0517')
_distdir="$_cpname-${pkgver}_$_cpver"

build() {
    cd "$_distdir"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "$_distdir"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
}

package() {
    cd "$_distdir"
    make install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
