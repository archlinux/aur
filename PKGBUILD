# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-datetime-format-natural
_dist=DateTime-Format-Natural
pkgver=1.18
pkgrel=2
pkgdesc='Parse informal natural language date/time strings'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=SCHUBIGER
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d9346a4615035459d8bcee0fac3d4ebaea038f4f43b284f69edf73f6ed5751fe')

arch=(any)
depends=(perl-clone perl-datetime perl-datetime-hires perl-boolean)
makedepends=(perl-module-build)
checkdepends=(perl-module-util perl-test-mocktime-hires)
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
