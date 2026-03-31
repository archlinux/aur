# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Maxim Polishchuk <mpolishchuck@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_author=MIYAGAWA
_dist=Carton
pkgname=perl-${_dist@L}
pkgver=v1.0.35
pkgrel=1
pkgdesc='Perl module dependency manager (aka Bundler for Perl)'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-class-tiny>=1.001'
    'perl-cpan-meta-requirements>=2.121'
    'perl-cpan-meta>=2.120921'
    'perl-getopt-long>=2.39'
    'perl-json-pp>=2.27300'
    'perl-menlo-legacy>=1.9018'
    'perl-module-corelist'
    'perl-module-cpanfile>=0.9031'
    'perl-parent>=0.223'
    'perl-path-tiny>=0.033'
    'perl-try-tiny>=0.09'
    'perl>=5.8.5'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-version>=0.77'
)
optdepends=(
    'perl-app-fatpacker'
    'perl-file-pushd'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9c4558ca97cd08b69fdfb52b28c3ddc2043ef52f0627b90e53d05a4087344175')

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
