# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail.com>
# Contributor: Tom K <tomk at runbox.com>
# Contributor: Robin Becker <robin at reportlab.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Gtk2-TrayIcon'
pkgname='perl-gtk2-trayicon'
pkgver=0.07
pkgrel=2
pkgdesc='(DEPRECATED) Perl interface to the EggTrayIcon library'
arch=('i686' 'x86_64' 'aarch64')
url="https://metacpan.org/release/${_distname}"
license=('LGPL-2.0-or-later')
options=('!emptydirs')
depends=(
  'glib-perl'
  'glib2'
  'glibc'
  'gtk2'
  'gtk2-perl'
  'perl'
)
makedepends=(
  'perl-extutils-depends'
  'perl-extutils-pkgconfig'
)
_author='XAOC'
source=("https://search.cpan.org/CPAN/authors/id/${_author::1}/${_author::2}/${_author}/${_distname}-${pkgver}.tar.gz")
sha512sums=('4f2a156ef2f5556d731feb2b11b4d8b9bd43f79605ab0e9ed82a7b9e5b116db1cac782ddf787b794ba9df1c4d35c4c313df035dc1caf023ac54e6a90cc6c511a')
_distdir="${_distname}-${pkgver}"

prepare() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distdir}"
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
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distdir}"
    make
  )
}

check() {
  cd "${srcdir}/${_distdir}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_distdir}"
  make install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
