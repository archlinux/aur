# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=ls++
pkgver=0.36
_gitcommit=e17221c78f398fc9180631c684cdefabb45d1595
pkgrel=3
epoch=1
pkgdesc='Colorized LS on steroids'
url='https://github.com/trapd00r/ls--/'
arch=('any')
license=('GPL2')
depends=('perl-term-extendedcolor')
makedepends=('git')
backup=('etc/ls++.conf')
options=('!emptydirs')
source=(${pkgname}::"git+https://github.com/trapd00r/ls--#commit=${_gitcommit}")
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
    PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
    MODULEBUILDRC=/dev/null \
    perl Makefile.PL
  make
}

package() {
  cd ${pkgname}
  make PREFIX=/ DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
