# Contributor: : Kent Fredric <kentnl@cpan.org>
# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-test-file-sharedir'
pkgver=1.001001
pkgrel=1
pkgdesc='Create a Fake ShareDir for your modules for testing.'
_dist='Test-File-ShareDir'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6' 'perl-file-sharedir>=1.00' 'perl-path-tiny>=0.018' 'perl-class-tiny>=0' 'perl-file-copy-recursive>=0' 'perl-exporter>=5.57' 'perl-scope-guard>=0' 'perl-parent>=0' 'perl-carp>=0')
checkdepends=('perl>=5.6' 'perl-pathtools>=0' 'perl-extutils-makemaker>=0' 'perl-test-simple>=0.96' 'perl-test-fatal>=0' 'perl-lib>=0')
provides=('perl-test-file-sharedir-dist=1.001001' 'perl-test-file-sharedir-module=1.001001' 'perl-test-file-sharedir-object-dist=1.001001' 'perl-test-file-sharedir-object-inc=1.001001' 'perl-test-file-sharedir-object-module=1.001001' 'perl-test-file-sharedir-tempdirobject=1.001001' 'perl-test-file-sharedir-utils=1.001001')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/$_dist-$pkgver.tar.gz")
sha256sums=('c8815ee3644949ad6419616c2706a04b3c22d709bfb610ad5c4cfe78884a8658')

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
