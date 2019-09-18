# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
pkgver=4.14
pkgrel=1
pkgdesc="Control multiple open terminal windows with connections to specified hosts and an administration console"
arch=('any')
url="https://sourceforge.net/projects/clusterssh/"
license=('GPL')
depends=('xterm' 'perl-exception-class' 'perl-try-tiny' 'perl-tk' 'perl-x11-protocol-other')
checkdepends=('perl-cpan-changes' 'perl-file-slurp' 'perl-file-which' 'perl-readonly'
              'perl-test-differences' 'perl-test-distmanifest' 'perl-test-perltidy'
              'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-pod-coverage'
              'perl-test-trap' 'perl-sort-naturally')
makedepends=('perl-module-build')
options=('!emptydirs')
changelog=$pkgname.changelog
source=($pkgname-$pkgver.tar.gz::https://github.com/duncs/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('179ac8a7c27ec9674d2aa3f65ebb097b4945646c71f83f52fe2b8b24c21cd629')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  perl Build.PL installdirs=vendor
  ./Build
}

check() {
  cd "${srcdir}"/$pkgname-$pkgver

#  ./Build test
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./Build install destdir="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
