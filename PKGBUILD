# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="perl-convert-color"
_cpanname="Convert-Color"
pkgver="0.11"
pkgrel="1"
pkgdesc="Color space conversions and named lookups"
arch=("any")
url="http://search.cpan.org/~pevans/$_cpanname"
license=("GPL" "PerlArtistic")
depends=("perl>=5.5.0" "perl-list-utilsby")
makedepends=("perl-module-pluggable" "perl-test-number-delta")
options=("!emptydirs")
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/$_cpanname-$pkgver.tar.gz")
sha1sums=("c555c9e708587022cb2d5cfd12ebc094cee6e708")

# Function to change to the working directory and set
# environment variables to override undesired options.
prepareEnvironment() {
  cd "$srcdir/$_cpanname-$pkgver"
  export \
    PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  prepareEnvironment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepareEnvironment
  make test
}

package() {
  prepareEnvironment
  make install

  # Remove "perllocal.pod" and ".packlist".
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
