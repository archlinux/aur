# Maintainer: Leo "em0lar" Maroni <hello@em0lar.de>
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DeutscheBahn
pkgname=perl-travel-status-de-deutschebahn
pkgver=3.01
pkgrel=1
pkgdesc='Interface to the DeutscheBahn online departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-DeutscheBahn/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-json'
  'perl-lwp-protocol-https'
  'perl-list-moreutils'
  'perl-xml-libxml'
)
makedepends=(
  'perl-module-build'
  'perl-test-compile'
  'perl-test-pod'
)
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('ee3411f56432bea92b8a406be53bcbb1' 'd24f309994a3151a17c66844ab51e5ec')

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
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
