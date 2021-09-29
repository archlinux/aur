# Maintainer: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>

pkgname=pgformatter
pkgver=5.1
pkgrel=1
pkgdesc="A PostgreSQL SQL syntax beautifier"
arch=('any')
url="https://github.com/darold/pgformatter"
license=('BSD')
depends=('perl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('86afb0e77a000145bdcfbd3d5f91c59dc8de3676b4e764a4b86147a52fd7787681b33f4e23a4e0eb9b15e9a24d5b60eb01c90574f59ff5cab2f33489c5f2e91b')
b2sums=('e6615cc2b2d98bbbff18f6a13694061639566ef96f991fa6cb6c3c43df5fa502d814a965b5cb287675152ddc2990d8170a325bc7cd75d0f5d8b6fb903fc21c71')

build() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  perl Makefile.PL
  make
}

check() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # delete usr/lib as it's empty ...
  rm -rf "$pkgdir/usr/lib"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
