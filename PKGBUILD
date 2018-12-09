# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
pkgver=4.13.2_01
pkgrel=1
pkgdesc="Control multiple open terminal windows with connections to specified hosts and an administration console"
arch=('any')
url="http://sourceforge.net/projects/clusterssh/"
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
sha256sums=('be6da42d448d925485d24c060f93215980e4e603476d61e18e79e219facea65a')

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
