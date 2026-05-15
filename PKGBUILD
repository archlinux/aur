# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PERLANCAR
_dist=Unix-Passwd-File
pkgname=perl-${_dist@L}
pkgver=0.251
pkgrel=1
pkgdesc='Manipulate /etc/{passwd,shadow,group,gshadow} entries'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-crypt-password-util>=0.06'
    'perl-experimental'
    'perl-file-flock-retry>=0.631'
    'perl-list-moreutils'
    'perl-scalar-list-utils>=1.45'
    'perl>=5.10.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-file-chdir'
    'perl-file-copy-recursive'
    'perl-file-path'
    'perl-file-slurper'
    'perl-file-temp'
    'perl-findbin'
    'perl-io'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('840e64e9f58de2d8ba8da47c041efc15e56696de39ea9c43be7f9b2283924261')

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
