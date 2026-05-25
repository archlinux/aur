# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SKAJI
_dist=Proc-ForkSafe
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
pkgdesc='help make objects fork safe'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.24.0')
makedepends=('perl-module-build-tiny>=0.053')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('85fcd3b335d6b8cda602d32b4f705617fe9f193e23c63858a9c019d3a4c09856')

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
