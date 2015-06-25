# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dist-zilla-plugin-podweaver'
pkgver=4.006
pkgrel=1
pkgdesc='weave your Pod together from configuration and Dist::Zilla'
_dist='Dist-Zilla-Plugin-PodWeaver'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-dist-zilla>=5' 'perl-pod-weaver>=4' 'perl-list-moreutils>=0' 'perl-moose>=0' 'perl-ppi>=0' 'perl-pod-elemental-perlmunger>=0.1' 'perl-namespace-autoclean>=0')
check_depends=('perl-file-find-rule>=0' 'perl-test-more>=0.96')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('744626bf9a22b5bed3b9151b676fee78e21348feae62a58f537d8ec08bc5250a')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
