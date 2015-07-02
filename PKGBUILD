# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-trash-freedesktop
_lastauthor=P/PE/PERLANCAR
_pkgname=File-Trash-FreeDesktop
pkgver=0.17
pkgrel=1
pkgdesc='freedesktop.org trash specification'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-remove' 'perl-log-any' 'perl-file-homedir' 'perl-sys-filesystem' 'perl-sys-filesystem-mountpoint' 'perl-file-moreutil' 'perl-list-moreutils')
checkdepends=('perl-file-slurp-tiny' 'perl-file-chdir' 'perl-test-exception')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('fec17a927da6c2d5240206315c565a3de8c7a7f98ff2535f1423d7ce5407ce062462ddfa4df7650b22a5805461950949599b44d3389cbbe44e7f12d61eb00600')

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

