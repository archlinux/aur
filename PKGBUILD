# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=Task-Kensho
pkgname=perl-${_dist@L}
pkgver=0.41
pkgrel=1
pkgdesc='A Glimpse at an Enlightened Perl'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.6.0')
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-task-kensho-async: Async Programming'
    'perl-task-kensho-cli: Useful Command-line Tools'
    'perl-task-kensho-config: Config Modules'
    'perl-task-kensho-dates: Date Modules'
    'perl-task-kensho-dbdev: Database Development'
    'perl-task-kensho-email: Email'
    'perl-task-kensho-excelcsv: Excel/CSV'
    'perl-task-kensho-exceptions: Exception Handling'
    'perl-task-kensho-hackery: Script Hackery'
    'perl-task-kensho-logging: Logging'
    'perl-task-kensho-moduledev: Module Development'
    'perl-task-kensho-oop: Object Oriented Programming'
    'perl-task-kensho-scalability: Scalability'
    'perl-task-kensho-testing: Testing'
    'perl-task-kensho-toolchain: Basic Toolchain'
    'perl-task-kensho-webcrawling: Web Crawling'
    'perl-task-kensho-webdev: Web Development'
    'perl-task-kensho-xml: XML Development'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('299b3c05abf0730609958c565d35e16b0601ea0f46c1992b93882706682b2fab')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
