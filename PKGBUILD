# Contributor: Konstantin Stepanov <me@kstep.me>
pkgname=perl-fusqlfs
perlname='FusqlFS'
pkgver=0.009
pkgrel=1
pkgdesc="${perlname} module which implements FUSE file system for database management. Supports PgSQL, MySQL and SQLite, can be extended to support other DBs."
arch=('any')
url="http://search.cpan.org/dist/${perlname}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-fuse' 'perl-dbi' 'perl-getopt-argvfile')
makedepends=('perl-module-build' 'perl-test-deep')
optdepends=('perl-dbd-mysql: MySQL backend support'
            'perl-dbd-pg: PgSQL backend support'
            'perl-dbd-sqlite: SQLite backend support'
            'perl-yaml-tiny: YAML output format support'
            'perl-xml-simple: XML output format support'
            'perl-yaml-syck: JSON output format support')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/K/KS/KSTEPME/${perlname}-${pkgver}.tar.gz")
md5sums=('2101520ba09b54157d7ffa1fc21bdd4a')

build() {
    cd "$srcdir/$perlname-$pkgver"

    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null

    { /usr/bin/perl Build.PL &&
        ./Build &&
        ./Build test &&
        ./Build install; } || return 1
}

