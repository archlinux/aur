# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-trash-freedesktop
_lastauthor=P/PE/PERLANCAR
_pkgname=File-Trash-FreeDesktop
pkgver=0.18
pkgrel=1
pkgdesc='freedesktop.org trash specification'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-remove' 'perl-log-any' 'perl-file-homedir' 'perl-sys-filesystem' 'perl-sys-filesystem-mountpoint' 'perl-file-moreutil' 'perl-list-moreutils' 'perl-log-any-iflog')
checkdepends=('perl-file-slurp-tiny' 'perl-file-chdir' 'perl-test-exception')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('9ee5eb422fd57a5a6afaebc3159b68be8e2d5d565bab6a3b38b0b16ca9bc76da3f9ac052942ed5c8c68b9ee92741f9a909e035955115a83e7707373de29a1bc9')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

