# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

_author=SHLOMIF
_dist=Clipboard
pkgname=perl-${_dist@L}
pkgver=0.32
pkgrel=1
pkgdesc='Copy and paste with any OS'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-cgi'
    'perl-file-temp'
    'perl-pathtools'
    'perl-uri'
    'xclip'
)
makedepends=('perl-module-build>=0.28')
checkdepends=(
    'perl-lib'
    'perl-test-simple'
)
optdepends=('xsel: XSel support')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('95e234cde474cd62ee762f45f8c9d8297436c61ac53bc6af7a73c257358c4bd0')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

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
