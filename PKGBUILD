# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-xml-sax-expatxs
pkgver=1.33
pkgrel=1
pkgdesc="Perl SAX 2 XS extension to Expat parser"
arch=('any')
url="https://metacpan.org/release/XML-SAX-ExpatXS/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/P/PC/PCIMPRICH/XML-SAX-ExpatXS-${pkgver}.tar.gz")
md5sums=('3d69bb642ea275871a2f91a08a51cd8c')

prepare() {
  export _src_dir="$srcdir/XML-SAX-ExpatXS-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "$_src_dir"
  sed -i -e "s|y/|n/|" ./Makefile.PL # fix from gentoo .ebuild
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
