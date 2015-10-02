# Maintainer: Mark Grimes <mgrimes at peculier dot com>
# https://github.com/mvgrimes/aur-perl-media-datetime

pkgname=perl-media-datetime
pkgver=0.48
pkgrel=1
pkgdesc=" A simple module to extract the timestamp from media files in an flexible manner."
_dist=Media-DateTime
arch=('any')
url="https://metacpan.org/module/$_dist"
license=('PerlArtistic')
depends=(perl perl-module-build perl-datetime perl-try-tiny perl-module-pluggable perl-image-exiftool)
# 'DateTime::TimeZone' => 0,
# 'File::Which'        => 0,
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/M/MG/MGRIMES/${_dist}-${pkgver}.tar.gz)
md5sums=('5e2444c99e45e2bdb45d472bb13a7b43')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
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
