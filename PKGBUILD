# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-pod-abstract
pkgver=0.20
pkgrel=1
_author="B/BL/BLILBURNE"
_perlmod="Pod-Abstract"
pkgdesc="Pod-Abstract - Abstract document tree for Perl POD documents"
arch=('any')
url="http://search.cpan.org/dist/Pod-Abstract/"
license=('GPL' 'PerlArtistic')
depends=(perl-io-string perl-task-weaken)
checkdepends=()
makedepends=()
provides=(
perl-pod-abstract-buildnode
perl-pod-abstract-filter
perl-pod-abstract-filter-add_podcmds
perl-pod-abstract-filter-clear_podcmds
perl-pod-abstract-filter-cut
perl-pod-abstract-filter-find
perl-pod-abstract-filter-number_sections
perl-pod-abstract-filter-overlay
perl-pod-abstract-filter-sort
perl-pod-abstract-filter-summary
perl-pod-abstract-filter-uncut
perl-pod-abstract-filter-unoverlay
perl-pod-abstract-node
perl-pod-abstract-parser
perl-pod-abstract-path
perl-pod-abstract-serial
perl-pod-abstract-tree 
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")

build(){
  cd "$srcdir"/$_perlmod-$pkgver

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    /usr/bin/perl Makefile.PL
    make
  # If using Build.PL
  elif [ -r Build.PL ]; then
    /usr/bin/perl Build.PL
    perl Build
  fi
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver

  prove -r
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver

  # If using Makefile.PL
  if [ -r Makefile.PL ]; then
    make install
  # If using Build.PL
  elif [ -r Build.PL ]; then
    perl Build install
  fi

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

sha256sums=('956ef7bb884c55456e2fb6e7f229f9a87dd50a61d700500c738db8f2ba277f87')
