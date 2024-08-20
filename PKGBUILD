# Maintainer: Mark Grimes <mgrimes at tgfmail dot org>
# https://github.com/mvgrimes/aur-perl-datetime-format-datemanip

pkgname=perl-datetime-format-datemanip
pkgver=0.04
pkgrel=7
pkgdesc="Perl DateTime extension to convert Date::Manip dates and durations to DateTimes and vice versa."
_dist=DateTime-Format-DateManip
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-date-manip perl-module-build)
makedepends=(perl-datetime)
options=('!emptydirs' purge)
source=(http://cpan.metacpan.org/authors/id/B/BB/BBENNETT/dt-fmt-datemanip/DateTime-Format-DateManip-0.04.tar.gz tz-env-variable.patch)
md5sums=('5965a3b4760c8aafb7471ba37d3a39c4' '4244322a3e412ea4e84003cee83b6f40')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
}

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch -Np1 -i ../tz-env-variable.patch
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  ./Build install installdirs=vendor destdir="$pkgdir"
}
