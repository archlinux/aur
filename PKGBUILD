# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-archive-tar-wrapper'
pkgver=0.38
pkgrel=1
pkgdesc="API wrapper around the 'tar' utility"
_dist='Archive-Tar-Wrapper'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-file-temp>=0' 'perl-file-which>=0' 'perl-log-log4perl>=0' 'perl-pathtools>=0' 'perl-ipc-run>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/A/AR/ARFREITAS/$_dist-$pkgver.tar.gz")
sha256sums=('19f3d0daa8b95cffb68c704350dd0674a23e1d2f14d032903b7e9609edb7b37a')

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
