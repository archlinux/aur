# Maintainer: 

pkgname=perl-perl4-corelibs
pkgver=0.004
pkgrel=8
pkgdesc="Libraries historically supplied with Perl 4"
arch=('any')
url="https://metacpan.org/release/Perl4-CoreLibs"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-$pkgver.tar.gz")
sha512sums=('71083f1640e95559ee4bc5a7f1bbe6beacec048a073e211ab7f6ee4de26463f6ae3d87e99e00a41ea8f2f93a5e96367bafe907ef3367e400de35123c22eb7b88')

prepare() {
  cd Perl4-CoreLibs-$pkgver

  # issue in testsuite - delay issue until 2040...
  # https://rt.cpan.org/Public/Bug/Display.html?id=131341
  sed -i "s#< 70#< 90#" t/timelocal.t
}

build() {
  cd Perl4-CoreLibs-$pkgver
  perl Build.PL
  ./Build
}

check() {
  cd Perl4-CoreLibs-$pkgver
  ./Build test
}

package() {
  cd Perl4-CoreLibs-$pkgver
  ./Build install installdirs=vendor destdir="$pkgdir"
}
