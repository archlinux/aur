# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-app-cpm
_lastauthor=S/SK/SKAJI
_pkgname=App-cpm
pkgver=0.997011
pkgrel=1
pkgdesc='a fast CPAN module installer'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(
	perl-class-tiny
	perl-command-runner
	perl-cpan-common-index
	perl-cpan-distnameinfo
	perl-cpan-meta
	perl-extutils-installpaths
	perl-file-copy-recursive
	perl-file-pushd
	perl-http-tinyish
	perl-json-pp
	perl-local-lib
	perl-menlo-legacy
	perl-module-cpanfile
	perl-parallel-pipes
	perl-parse-pmfile
)
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('632102c6e67de7c9cff51d6faa0d9d03bfefbed35b5cc5d96919f7b9202501c9')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}

