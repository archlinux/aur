# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-microformats2'
pkgver='0.511'
pkgrel='3'
pkgdesc="Read Microformats2 metadata from HTML or JSON"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-datetime-format-iso8601>=0' 'perl-html-parser>=0' 'perl-html-treebuilder-xpath>=0' 'perl-json>=0' 'perl-moo>=0' 'perl-moox-handlesvia>=0' 'perl-path-class>=0' 'perl-readonly>=0' 'perl-type-tiny>=0' 'perl-uri>=0' 'perl>=5.10.0')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='https://metacpan.org/release/Web-Microformats2'
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMAC/Web-Microformats2-$pkgver.tar.gz" "geourl.html.patch" "geourl.json.patch")
md5sums=('d4e81687ec479139340076e47ad58950'
         '1ad83ce9d6a3b480e4c4c5dc6e5e79fa'
         '36907599564f0b2a875440705632ac8f')
sha512sums=('91cfd8e2e0c6f70c3027871c92c70b5901a862e3d7b1543708c0ef9eadeac8be530c42e4ae3af32af40bae82fefd8f95b6926f540e219208b833abc93d07c7e8'
            'ece4f3a437965633f5b632617e7575c37f74f105fd84bc37789f3817fdea8e603b431631145a594161d35eb48853efa78e47f5c26699bf790820b6605bb27db3'
            '6d92bf62f1b47a77884132722470a3ff4ce93ab0e686c15a7f4700e26db20564b32035cafcc1d1930a067261d1fda87b3c01187f7dc566732ddc5ce4c48bb246')
_distdir="Web-Microformats2-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
   /usr/bin/perl Build.PL
   /usr/bin/perl Build
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  /usr/bin/perl Build test
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

prepare() {
    cd "$srcdir/$_distdir"
    patch --merge --no-backup-if-mismatch --forward --strip=1 --input="${srcdir}/geourl.html.patch"
    patch --merge --no-backup-if-mismatch --forward --strip=1 --input="${srcdir}/geourl.json.patch"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
