# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="GD-SecurityImage"
_modnamespace=GD
pkgname=perl-gd-securityimage
pkgver=1.75
pkgrel=4
pkgdesc="Security image (captcha) generator"
arch=(any)
url="https://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-gd')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('841e89a1696108b7733c3273d005c989dc73d7c24e481a060f62b0dcbc53ba79826653b760358027ccc6e266dc1733a64e313740371e2e3bcab32ac92c5fcecb')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
