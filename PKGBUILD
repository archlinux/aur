# Maintener: sputnick <gilles DOT quenot AT gmail DOT com>
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-http-proxy'
pkgver='0.304'
pkgrel='1'
pkgdesc="HTTP proxy"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
makedepends=('perl-libwww' 'perl-test-simple')
url='http://search.cpan.org/dist/HTTP-Proxy'
source=("http://mirror.ibcp.fr/pub/CPAN/authors/id/B/BO/BOOK/HTTP-Proxy-${pkgver}.tar.gz")
md5sums=('09ac64c5f67b7d8baff4ea135d74af48')
_dist_dir="HTTP-Proxy-${pkgver}"

build() {
  export PERL_MM_USE_DEFAULT=1 export PERL_AUTOINSTALL=--skipdeps
  { cd "$_dist_dir" &&
    /usr/bin/perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test
  } || return 1
}

package() {
    cd "$_dist_dir"
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
    make DESTDIR="$pkgdir" install
}
