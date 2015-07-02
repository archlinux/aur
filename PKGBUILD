# Maintainer: 3ED_0  <krzysztof1987 /ta/ gmail \tod\ com>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-test-corpus-audio-mpd
_lastauthor=J/JQ/JQUELIN
_pkgname=Test-Corpus-Audio-MPD
pkgver=1.120990
pkgrel=1
pkgdesc="automate launching of fake mdp for testing purposes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir>=1.00' 'perl-file-sharedir-pathclass' 'perl-path-class' 'perl-readonly')
makedepends=('perl-module-build')
url="http://search.cpan.org/dist/${_pkgname}"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('dedba59ad19b19890b94cc6da3b9f61c768a98891c49d3e4cbefeb11c7e91805')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

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
