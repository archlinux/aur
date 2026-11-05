# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-datetime-format-natural
_dist=DateTime-Format-Natural
pkgver=1.27
pkgrel=1
pkgdesc='Parse informal natural language date/time strings'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=SCHUBIGER
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('077ea2321a83b2481edb0efeeecfb7e8aefe6140988a171dd09caba06e757d5c')

arch=(any)
depends=(
  perl-boolean
  perl-clone
  perl-datetime
  perl-datetime-hires
  perl-datetime-timezone
  perl-params-validate
  perl-scalar-list-utils
)
makedepends=(perl-module-build)
checkdepends=(perl-module-util perl-test-mocktime-hires)
optdepends=(
  'perl-date-calc'
  'perl-datetime-calendar-julian'
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL --create_packlist=0
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
