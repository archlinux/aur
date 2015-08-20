# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-archive-tar-wrapper'
pkgver=0.23
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
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/$_dist-$pkgver.tar.gz")
sha256sums=('4c02393a513619e123cff5f6bd3021b64b3e3146fac9dc2da02329de440674fa')

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
