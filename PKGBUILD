# Maintainer: 

pkgname=perl-perl4-corelibs
pkgver=0.005
pkgrel=2
pkgdesc="Libraries historically supplied with Perl 4"
arch=('any')
url="https://metacpan.org/release/Perl4-CoreLibs"
license=('PerlArtistic' 'GPL')
# chat2.pl uses `hostname`
depends=('perl' 'inetutils')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Perl4-CoreLibs-$pkgver.tar.gz")
sha512sums=('87e4c153f2fead9eae9ea338b965294d8a2a1b0b5c6a25c7a4b18cab049526c26efaa7bb99f264e025d4a2893165b5960a6bff83c18f50af2106174b5b344981')

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
