# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-VRR
pkgname=perl-travel-status-de-vrr
pkgver=1.12
pkgrel=1
pkgdesc='Interface to the efa.vrr.de departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-VRR/'
license=('PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-libwww' 'perl-xml-libxml')
makedepends=('perl-module-build' 'perl-file-slurp' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('d351e335ee93f59c191bded3cf9c7513' '5e4ca53dbb05a5c148ca67b60b39379c')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
