# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=NEELY
_dist=Data-Serializer
pkgname=perl-${_dist@L}
pkgver=0.65
pkgrel=2
pkgdesc='Modules that serialize data structures'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-autoloader'
    'perl-data-dumper>=2.08'
    'perl-digest-sha'
    'perl-exporter'
    'perl-io'
)
makedepends=(
    'perl-module-build>=0.35'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=(
    'perl-bencode'
    #'perl-compress-ppmd'  # Compress-PPMd dist does not exist on CPAN anymore.
    'perl-config-general'
    'perl-convert-bencode'
    #'perl-convert-bencode_xs'  # Failing its tests.
    'perl-crypt-blowfish'
    'perl-crypt-cbc'
    'perl-data-denter'
    'perl-data-taxi'
    'perl-freezethaw'
    'perl-io-compress'
    'perl-json'
    'perl-json-xs'
    'perl-mime-base64'
    'perl-php-serialization'
    'perl-storable'
    'perl-xml-dumper'
    'perl-xml-simple'
    'perl-yaml'
    'perl-yaml-syck'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('12155a5200033d80a5f07573775f493f170072cf7b28ae3ca2d152b591971f11')

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
