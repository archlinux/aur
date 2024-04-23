# Maintainer: Matthias Bethke <matthias@towiski.de>

pkgname='perl-archive-tar-wrapper'
pkgver=0.39
_distver=rel_039
pkgrel=1
pkgdesc="API wrapper around the 'tar' utility"
_dist='archive-tar-wrapper-perl'
arch=('any')
url="https://github.com/glasswalk3r/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-file-temp>=0' 'perl-file-which>=0' 'perl-log-log4perl>=0' 'perl-pathtools>=0' 'perl-ipc-run>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("https://github.com/glasswalk3r/$_dist/archive/refs/tags/$_distver.tar.gz")
sha256sums=('6f36a9117aac1a75a380c9e2247c183933c98f79a1e62c9a4c715c761e394441')

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
