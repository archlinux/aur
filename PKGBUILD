# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-universal-ref'
pkgver=0.14
pkgrel=1
pkgdesc='Turns ref() into a multimethod'
_dist='UNIVERSAL-ref'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl>=5.6' 'perl-b-utils>=0' 'perl-xsloader>=0' 'perl-test-simple>=0')
checkdepends=()
makedepends=('perl-test-simple>=0')
provides=()
options=('!emptydirs' 'purge')
source=(
    "http://search.cpan.org/CPAN/authors/id/J/JJ/JJORE/$_dist-$pkgver.tar.gz"
    'fix-25.patch'
)
sha256sums=(
    '35d815c49090d57b7051806ae1c4844879131791de1b861613c55a90a46b28ab'
    '5c4d3ff7b699e443bd57b67472c3fbdc9a85cef191e555bc598b6af49f301b7d'
)

prepare() {
    cd "$srcdir/$_dist-$pkgver"
    patch -Np1 -i "${srcdir}/fix-25.patch"
}
build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
