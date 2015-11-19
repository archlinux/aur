# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

_perlmod=Travel-Status-DE-URA
pkgname=perl-travel-status-de-ura
pkgver=1.00
pkgrel=1
pkgdesc='Travel::Status::DE::URA is an inofficial interface to URA-based departure monitors (as used by ASEAG)'
url='http://finalrewind.org/projects/Travel-Status-DE-URA/'
license=('GPL' 'PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-datetime' 'perl-datetime-format-duration'
          'perl-list-moreutils' 'perl-libwww' 'perl-list-allutils' 'perl-text-csv')
makedepends=('perl-file-slurp' 'perl-test-pod')
options=('!emptydirs')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('c344ed237d8a5b2c4ec3d38f4949646553412f67b66360faf6e7a661788892bf')

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
