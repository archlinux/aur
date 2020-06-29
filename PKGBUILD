# Maintainer: web.de jan.stuehler
_pkgname=chordpro
_author="Johan Vromans"
pkgname=chordpro-git
pkgbase=chordpro-git
pkgver=R0_974.r497.g2e186a0
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets.'
arch=('any')
url="https://github.com/ChordPro/chordpro"
license=('Artistic2.0')
provides=($pkgname)
optdepends=(perl-text-layout)
depends=(git perl-string-interpolate-named perl-font-ttf perl-image-info perl-io-string perl-json-pp perl-pdf-api2 perl-app-packager perl-file-loadlines)
options=('!emptydirs' purge)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  /usr/bin/make
}

check() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir/
  #/usr/bin/find ${startdir}/pkg -name '.packlist' -delete
  #/usr/bin/find ${startdir}/pkg -name '*.pod' -delete
}

