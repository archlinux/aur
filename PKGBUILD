# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-CallParser
cpanauthor=ZEFRAM
pkgname=perl-devel-callparser
pkgver=0.002
pkgrel=3
pkgdesc="Perl Devel::CallParser CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-data-alias'
   'perl-devel-callchecker'
   'perl-devel-declare'
   'perl-dynaloader-functions'
   'perl-lexical-var'
   'perl-test-pod'
   'perl-test-pod-coverage'
)
makedepends=(
   'perl-module-build'
)
source=(
    "http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz"
    'fix-24.patch::https://github.com/yardenac/perl-devel-callparser/commit/10ca029627fa4e7f3e507c9fd8288efc50360655.patch'
)
sha256sums=(
    '24b198c0fdde08a526559759dc49238f5acf1a960580880d5e6a864b5d7b3167'
    '4eca2ac1be39ea45197c2d32bdf43b8a836d0318bea6b021735fb56566becd2d'
)

prepare() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    patch -Np1 -i "${srcdir}/fix-24.patch"
}
build() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    perl Build.PL
    ./Build
}

check() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    ./Build test
}

package () {
    cd "${srcdir}/${cpaname}-${pkgver}"
    ./Build install --installdirs vendor --destdir "${pkgdir}"
}
