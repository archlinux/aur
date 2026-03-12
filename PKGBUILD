# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SKAJI
_dist=Parallel-Pipes
_ver=0.201
pkgname=perl-${_dist@L}
pkgver=${_ver#v}
pkgrel=1
pkgdesc='parallel processing using pipe(2) for communication and synchronization'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.8.1')
makedepends=(
    'perl-module-build-tiny>=0.052'
    'perl>=5.8.1'
)
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$_ver.tar.gz")
sha256sums=('b73cbdd4202b29eab97e0c08dcd59d9273633610e8721cf449078656bd591a7c')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
