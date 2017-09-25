# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-build
pkgver=1.18
pkgrel=2
_author="P/PL/PLICEASE"
_perlmod="Alien-Build"
pkgdesc="Alien::Build::MM - Alien::Build installer code for ExtUtils::MakeMaker"
arch=('any')
url="http://search.cpan.org/dist/Alien-Build/"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-alien-base-modulebuild)
provides=(
perl-alien-base
perl-alien-base-wrapper
perl-alien-build
perl-alien-build-commandsequence
perl-alien-build-interpolate
perl-alien-build-interpolate-default
perl-alien-build-mm
perl-alien-build-plugin
perl-alien-build-plugin-build-autoconf
perl-alien-build-plugin-build-cmake
perl-alien-build-plugin-build-msys
perl-alien-build-plugin-build-make
perl-alien-build-plugin-build-searchdep
perl-alien-build-plugin-core-download
perl-alien-build-plugin-core-ffi
perl-alien-build-plugin-core-gather
perl-alien-build-plugin-core-legacy
perl-alien-build-plugin-core-override
perl-alien-build-plugin-core-setup
perl-alien-build-plugin-core-tail
perl-alien-build-plugin-decode-dirlisting
perl-alien-build-plugin-decode-dirlistingftpcopy
perl-alien-build-plugin-decode-html
perl-alien-build-plugin-download-negotiate
perl-alien-build-plugin-extract-archivetar
perl-alien-build-plugin-extract-archivezip
perl-alien-build-plugin-extract-commandline
perl-alien-build-plugin-extract-directory
perl-alien-build-plugin-extract-negotiate
perl-alien-build-plugin-fetch-httptiny
perl-alien-build-plugin-fetch-lwp
perl-alien-build-plugin-fetch-local
perl-alien-build-plugin-fetch-localdir
perl-alien-build-plugin-fetch-netftp
perl-alien-build-plugin-gather-isolatedynamic
perl-alien-build-plugin-pkgconfig-commandline
perl-alien-build-plugin-pkgconfig-libpkgconf
perl-alien-build-plugin-pkgconfig-makestatic
perl-alien-build-plugin-pkgconfig-negotiate
perl-alien-build-plugin-pkgconfig-pp
perl-alien-build-plugin-prefer-badversion
perl-alien-build-plugin-prefer-sortversions
perl-alien-build-plugin-probe-cbuilder
perl-alien-build-plugin-probe-commandline
perl-alien-build-util
perl-alien-role
perl-test-alien
perl-test-alien-build
perl-test-alien-cancompile
perl-test-alien-canplatypus
perl-test-alien-run
perl-test-alien-synthetic
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8ebeaffcda2bac6fe65b64458d8c69865cf3275dce6fd6471861671ea97616f9')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    perl Makefile.PL
    make
  else
    perl Build.PL
    ./Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make test
  else
    ./Build test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  if [ -f Makefile.PL ]; then
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  else
    ./Build install --installdirs=vendor --destdir="$pkgdir"
  fi
}

