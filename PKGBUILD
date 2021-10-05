# Maintainer: xerus <27jf at pm dot me>
_pkgname=chordpro
pkgname="${_pkgname}-git"
pkgver=5.982.r6.gaf467dc
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets.'
arch=('any')
url="https://github.com/ChordPro/${_pkgname}"
license=('Artistic2.0')
provides=("${_pkgname}")
optdepends=()
depends=(git perl-app-packager perl-string-interpolate-named perl-font-ttf perl-image-info perl-io-string perl-json-pp perl-pdf-api2 perl-file-loadlines perl-pod-parser perl-text-layout)
options=('!emptydirs' purge)
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^R//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

