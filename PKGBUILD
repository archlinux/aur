# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Crotok <crotok@mailbox.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Gnome2-Wnck'
pkgname='perl-gnome2-wnck'
pkgver=0.18
pkgrel=4
pkgdesc='(DEPRECATED) Perl interface to the Window Navigator'
arch=('x86_64')
url="https://metacpan.org/release/${_distname}"
license=('LGPL-2.0-or-later')
options=('!emptydirs')
depends=(
  'gdk-pixbuf2'
  'glib-perl'
  'glib2'
  'glibc'
  'gtk2'
  'gtk2-perl'
  'libwnck'
)
makedepends=(
  'perl-extutils-depends'
  'perl-extutils-pkgconfig'
)
_author='XAOC'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/${_author}/${_distname}-${pkgver}.tar.gz")
sha512sums=('acf1b4213070a7696426e04246ed01f2ce2ae2b196a62e3e69feab782b590a495a482b8dee866d788eebe8cc5eae81db9171d72fb9ddd7509707090380a09a89')
_distdir="${_distname}-${pkgver}"

prepare() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
  )

  printf "Enabling verbose test output..."
  sed \
    -e 's/TEST_VERBOSE=0/TEST_VERBOSE=1/' \
    -i "${srcdir}/${_distdir}/Makefile"
  printf " done.\n"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    export WNCK_TEST_PAGER=1
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
