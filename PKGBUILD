# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SKAJI
_dist=Darwin-InitObjC
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
pkgdesc='initializes Objective-C runtime'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.24.0')
makedepends=('perl-module-build-tiny>=0.053')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c24d311a16e43418403a4533a19775663f75143bbefea46056c2b26c0023f088')

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
