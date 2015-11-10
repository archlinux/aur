# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
pkgver=4.04
pkgrel=1
pkgdesc="Control multiple open terminal windows with connections to specified hosts and an administration console"
arch=('any')
url="http://sourceforge.net/projects/clusterssh/"
license=('GPL')
depends=('xterm' 'perl-exception-class' 'perl-try-tiny' 'perl-tk' 'perl-x11-protocol')
checkdepends=('perl-cpan-changes' 'perl-file-slurp' 'perl-file-which' 'perl-readonly'
              'perl-test-differences' 'perl-test-distmanifest' 'perl-test-perltidy'
              'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-pod-coverage'
              'perl-test-trap' 'perl-sort-naturally')
makedepends=('perl-module-build')
options=('!emptydirs')
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/App-ClusterSSH-$pkgver.tar.gz)
sha256sums=('0f76cbca6a50c42366788c76f4d09713c6a21d43ff97cadbe660a1e3c5caaaae')

build() {
  cd "${srcdir}"/App-ClusterSSH-$pkgver

  perl Build.PL installdirs=vendor
  ./Build
}

check() {
  cd "${srcdir}"/App-ClusterSSH-$pkgver

  ./Build test
}

package() {
  cd "${srcdir}"/App-ClusterSSH-$pkgver

  ./Build install destdir="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
