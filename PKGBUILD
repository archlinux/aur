# Maintainer: xeruf <27jf at pm dot me>
_pkgname=chordpro
pkgname="${_pkgname}-dev-git"
pkgver=5.980.r138.g7261f0a
pkgrel=1
pkgdesc='Reference implementation of the ChordPro standard for musical lead sheets, development branch'
arch=('any')
url="https://github.com/ChordPro/${_pkgname}/tree/dev"
license=('Artistic2.0')
provides=("${_pkgname}")
depends=(git perl-app-packager perl-string-interpolate-named perl-font-ttf perl-image-info perl-io-string perl-json-pp perl-pdf-api2 perl-file-loadlines perl-pod-parser perl-text-layout perl-file-homedir)
optdepends=(perl-wx)
options=('!emptydirs' '!purge')
source=("git+https://github.com/ChordPro/chordpro.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^R//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
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
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir/
}
