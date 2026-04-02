# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DBOOK
_dist=Task-Kensho-All
pkgname=perl-${_dist@L}
pkgver=0.41
pkgrel=1
pkgdesc='Install all of Task::Kensho'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-2.0')
depends=(
    'perl-task-kensho-async>=0.41'
    'perl-task-kensho-cli>=0.41'
    'perl-task-kensho-config>=0.41'
    'perl-task-kensho-dates>=0.41'
    'perl-task-kensho-dbdev>=0.41'
    'perl-task-kensho-email>=0.41'
    'perl-task-kensho-excelcsv>=0.41'
    'perl-task-kensho-exceptions>=0.41'
    'perl-task-kensho-hackery>=0.41'
    'perl-task-kensho-logging>=0.41'
    'perl-task-kensho-moduledev>=0.41'
    'perl-task-kensho-oop>=0.41'
    'perl-task-kensho-scalability>=0.41'
    'perl-task-kensho-testing>=0.41'
    'perl-task-kensho-toolchain>=0.41'
    'perl-task-kensho-webcrawling>=0.41'
    'perl-task-kensho-webdev>=0.41'
    'perl-task-kensho-xml>=0.41'
    'perl-task-kensho>=0.41'
    'perl>=5.10.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4d21c31fc6c032056d2a51e3546d711be797efdba57d2e8ad4e539bec52c3750')

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
