# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SKAJI
_dist=Parallel-Pipes
pkgname=perl-${_dist@L}
pkgver=0.201
pkgrel=1
pkgdesc='parallel processing using pipe(2) for communication and synchronization'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.8.1')
makedepends=(
    'perl-module-build-tiny>=0.052'
    'perl>=5.8.1'
)
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b73cbdd4202b29eab97e0c08dcd59d9273633610e8721cf449078656bd591a7c')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
