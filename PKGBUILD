# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname='perl-moosex-fileattribute'
_pkgname='MooseX-FileAttribute'
pkgver=0.01
pkgrel=1
pkgdesc="Sugar for classes that have file or directory attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-types' 'perl-moosex-types-path-class')
makedepends=('perl-extutils-makemaker' 'perl-module-install' 'git')
checkdepends=('perl-test-simple' 'perl-test-exception')
url="https://metacpan.org/release/$_pkgname"
source=("$_pkgname::git+https://github.com/jrockway/moosex-fileattribute.git#commit=440a9e3")
md5sums=('SKIP')

build() {
  cd $_pkgname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $_pkgname
  make test
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set sw=2 et:
