# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25
# Maintainer: nyxkn <dev@nyxkn.net>

pkgname='perl-file-pid'
pkgver='1.01'
pkgrel='1'
pkgdesc="Pid File Manipulation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor')
makedepends=()
url='http://search.cpan.org/dist/File-Pid'
source=("http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/File-Pid-$pkgver.tar.gz")
sha256sums=('bafeee8fdc96eb06306a0c58bbdb7209b6de45f850e75fdc6b16db576e05e422')
_distdir="File-Pid-1.01"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

prepare() {
  # apply patch to fix bug #18960 as per https://rt.cpan.org/Public/Bug/Display.html?id=18960
  sed -i 's/my $pid  = $self->_get_pid_from_file;/my $pid  = $self->_get_pid_from_file or return undef;/' "$srcdir/$_distdir/lib/File/Pid.pm"
}

sha256sums=('bafeee8fdc96eb06306a0c58bbdb7209b6de45f850e75fdc6b16db576e05e422')
