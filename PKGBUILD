# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-trash-freedesktop
_author=PERLANCAR
_pkgname=File-Trash-FreeDesktop
pkgver=0.19
pkgrel=1
pkgdesc='freedesktop.org trash specification'
arch=('any')
license=('PerlArtistic')
depends=(
	'perl-file-homedir'
	'perl-file-moreutil'
	'perl-file-remove'
	'perl-sys-filesystem'
	'perl-sys-filesystem-mountpoint'
	'perl-list-moreutils'
	'perl-log-ger')
checkdepends=(
	'perl-file-slurp-tiny'
	'perl-file-chdir'
	'perl-test-exception')
url="https://metacpan.org/release/${_pkgname}"

options=('!emptydirs')
_lastauthor=${_author:0:1}/${_author:0:2}/${_author}
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('1205e677be5c13aba92aa6db707b438fccb27d52aa57a528eab6a9899f2a780300a3e8350d2d3da1ae2f4c85c403c954861b57dc323938dc45e7c8008e5ae342')

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

