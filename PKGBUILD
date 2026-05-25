# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: 3ED <krzysztof1987 at gmail dot com>

_author=SKAJI
_dist=Command-Runner
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
epoch=1
pkgdesc='run external commands and Perl code refs'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-capture-tiny'
    'perl-file-pushd'
    'perl-string-shellquote'
    'perl-win32-shellquote'
    'perl>=5.24.0'
)
makedepends=('perl-module-build-tiny>=0.053')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('80061e9d5e9d1d7cd61cc47bd0944e69ed8e5bb68e16e159d5caf902e11ebc38')

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
