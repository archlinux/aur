# Maintainer: Jonathan Mast <jon@jonmast.com>
pkgname=mythfs-perl
pkgver=1.36
pkgrel=1
pkgdesc='Fuse filesystem for accessing MythTV media'
_dist=Mythfs-perl
arch=('any')
url="https://github.com/lstein/mythfs-perl"
license=('GPL' 'PerlArtistic')
depends=(perl-fuse perl-libwww perl-timedate perl-xml-simple perl-json)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/L/LD/LDS/$_dist-$pkgver.tar.gz" "fuse-version.patch")
md5sums=('6be14cb1821d945dddd78a4790e4615e'
         'ffef02d1818aae7d3a8b5f065e8efd16')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch -p1 -i "$srcdir/fuse-version.patch"
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
