# Maintainer: Leo "em0lar" Maroni <hello@em0lar.de>
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-VRR
pkgname=perl-travel-status-de-vrr
pkgver=1.17
pkgrel=1
pkgdesc='Interface to the efa.vrr.de departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-VRR/'
license=('PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-lwp-protocol-https' 'perl-xml-libxml')
makedepends=('perl-module-build' 'perl-file-slurp' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')  # Daniel Friesel
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('ae19b805c1fdba08cd4265a885dc38b2' '3f28e6f743d5a01cade4efa45ecb5227')

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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
