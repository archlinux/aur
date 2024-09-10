# Maintainer: Matthias Bethke <matthias@towiski.de>

pkgname='perl-archive-tar-wrapper'
pkgver=0.42
_distver=0.42
pkgrel=1
pkgdesc="API wrapper around the 'tar' utility"
_dist='Archive-Tar-Wrapper'
arch=('any')
url="https://github.com/haarg/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-file-temp>=0' 'perl-file-which>=0' 'perl-log-log4perl>=0' 'perl-pathtools>=0' 'perl-ipc-run>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("https://github.com/haarg/$_dist/archive/refs/tags/v$_distver.tar.gz")
sha256sums=('3638a95ae678e8e1e5806ee5780d8014811462a4c4d1b153a924007596fbc833')

build() (
  cd "$srcdir/$_dist-$_distver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$_distver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$_distver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
