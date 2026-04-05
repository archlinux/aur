# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=HAARG
_dist=Catalyst-Devel
pkgname=perl-${_dist@L}
pkgver=1.42
pkgrel=2
pkgdesc='Catalyst Development Tools'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-action-renderview>=0.10'
    'perl-catalyst-plugin-configloader>=0.30'
    'perl-catalyst-plugin-static-simple>=0.28'
    'perl-catalyst-runtime>=5.90001'
    'perl-config-general>=2.42'
    'perl-file-changenotify>=0.07'
    'perl-file-copy-recursive'
    'perl-file-sharedir'
    'perl-module-install>=1.02'
    'perl-moose'
    'perl-moosex-emulate-class-accessor-fast'
    'perl-namespace-autoclean'
    'perl-namespace-clean'
    'perl-path-class>=0.09'
    'perl-template-toolkit>=2.14'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-file-sharedir-install'
)
checkdepends=(
    'perl-test-fatal>=0.003'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('7ec6f0b6cab5b8c097e47769fc73a4d4c015a58c41fdb40fc24df3ee77c48abd')

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
