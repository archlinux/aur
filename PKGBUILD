# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Math-NumSeq
cpanauthor=KRYDE
pkgname='perl-math-numseq'
pkgver=74
pkgrel=1
pkgdesc="number sequences"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
  perl
  perl-constant-defer
  perl-file-homedir
  perl-math-factor-xs
  perl-math-libm
  perl-math-prime-xs
  perl-module-pluggable
  perl-module-util
)
url=http://search.cpan.org/dist/${cpaname}
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
md5sums=('0ba288dae0dc957782a96e37b98438c0')
sha256sums=('b4a8b66b2131c46aa1bb58da2b9af77de22deed78ddf26c51743e32a225eff4b')
sha512sums=('2312b7dd5fcdc3e7be4a5575d999bdeff33eaa0e4742ee188298d0c362256c0f02b32d391f734d58c4f101b6590e3bf21c17eb789066d5cf057f1074195e77b7')

build() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/${cpaname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
