# Contributor: Troy Will <.com gmail AT troydwill>
pkgname=perl-forks-queue
pkgver=0.09
pkgrel=1
pkgdesc='This packages the Foo-Bar distribution, containing the Foo::Bar module!'
_dist=Forks-Queue
_author=M/MO/MOB
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-time-hires perl-json)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/$_author/$_dist-$pkgver.tar.gz")
md5sums=(55f13b2a8352b3140abb622403daee9e)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
