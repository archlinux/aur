# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-exporter-simple'
pkgver='1.10'
pkgrel='1'
pkgdesc="Easier set-up of module exports"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Exporter-Simple'
source=("https://cpan.metacpan.org/authors/id/M/MA/MARCEL/Exporter-Simple-$pkgver.tar.gz" '04.patch')
md5sums=('a32f682f3b882c4f3f91d0ad85ff1a01'
         '2697b90bc5bef113a0d150395067c0ca')
sha512sums=('487c4a225f3de8b793184e8bb78108488974338c425d9c37b0e9f2a701895b4749736011fc4ec9548a43f5aedc7270ce3b9db1e1a4630a49d994f5b2887d2861'
            'c056276df0ead632ed40d75516298784cd0497b892e8df10917e9659991d9aae8b1ed94d73e770feda91d070d812ece2cf41203778c25b1003237840f68dacba')
_distdir="Exporter-Simple-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

prepare() {
    cd "$srcdir/$_distdir"
    patch --forward --strip=1 --input="${srcdir}/04.patch"
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
