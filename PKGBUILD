# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-x11-xcb
_cpanname=X11-XCB
pkgver=0.09
pkgrel=1
pkgdesc="Perl bindings for libxcb"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
makedepends=('perl-xs-object-magic' 'perl-extutils-depends' 'libpthread-stubs' 'python')
depends=('libxau' 'libxdmcp' 'perl-mouse' 'perl-mousex-nativetraits' 'perl-try-tiny')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MS/MSTPLBG/${_cpanname}-${pkgver}.tar.gz")
md5sums=('49644e149df020e5b6a70f16a71cc9fe')

build() {
  cd  "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
