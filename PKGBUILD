# Maintainer: dringsim <dringsim@qq.com>
pkgname=tarcolor
pkgver=0.011
pkgrel=1
pkgdesc='colors output of `tar tvf`'
_dist=App-TarColor
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('BSD-3-Clause')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSABRAMO/$_dist-$pkgver.tar.gz")
sha256sums=('3a51c570a962612bb67f4d38be12251fc5ff69ee34781bfea1010b4ca075f036')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  install -Dm0755 -t "$pkgdir/usr/share/tarcolor/" etc/tarcolorauto.sh
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" etc/tarcolorauto.1
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

