# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

cpaname=Lexical-Var
cpanauthor=ZEFRAM
pkgname=perl-lexical-var
pkgver=0.010
pkgrel=1
pkgdesc="static variables without namespace pollution"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  perl
  perl-lexical-sealrequirehints
)
makedepends=(perl-module-build)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('127e0daef86409e81d7bcebffdd75f9f')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  ./Build test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
