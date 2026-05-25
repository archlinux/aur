# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SKAJI
_dist=Parallel-Pipes
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
epoch=1
pkgdesc='parallel processing using pipe(2) for communication and synchronization'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.24.0')
makedepends=('perl-module-build-tiny>=0.053')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('0e5efae6e71cf5255b881f0b7fa964913b741d0d085f85b79fb86edc3ba371f7')

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
