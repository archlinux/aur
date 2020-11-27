# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-command-runner
_lastauthor=S/SK/SKAJI
_pkgname=Command-Runner
pkgver=0.103
pkgrel=1
pkgdesc='run external commands and Perl code refs'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny' 'perl-string-shellquote')
url="https://metacpan.org/release/${_pkgname}/"
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0f180b5c3b3fc9db7b83d4a5fdd959db34f7d6d2472f817dbf8b4b795a9dc82a')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl ./Build.PL
  perl ./Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl ./Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl ./Build install
}

