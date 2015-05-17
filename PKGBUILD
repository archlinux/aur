# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Macfly <mmacfly@gmail.com>
# Contributor: Duncan Ferguson <duncan_ferguson@users.sourceforge.net>

pkgname=clusterssh
_pkgver=4.03_06
pkgver=${_pkgver/_/.}
pkgrel=1
pkgdesc="Control multiple open terminal windows with connections to specified hosts and an administration console"
arch=('any')
url="http://sourceforge.net/projects/clusterssh/"
license=('GPL')
depends=('xterm' 'perl-exception-class' 'perl-try-tiny' 'perl-tk' 'perl-x11-protocol')
checkdepends=('perl-cpan-changes' 'perl-file-slurp' 'perl-file-which' 'perl-readonly'
             'perl-test-differences' 'perl-test-distmanifest' 'perl-test-perltidy'
             'perl-test-pod' 'perl-test-pod-coverage' 'perl-test-pod-coverage' 'perl-test-trap')
options=('!emptydirs')
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/App-ClusterSSH-$_pkgver.tar.gz)
sha256sums=('f3c5c89669deb7a579be65a0dba1e197b6d8b9f1d5b3e48b8a0646193d0bf6f0')

build() {
  cd "${srcdir}"/App-ClusterSSH-$_pkgver

  perl Build.PL installdirs=vendor
  ./Build
}

check() {
  cd "${srcdir}"/App-ClusterSSH-$_pkgver

#https://github.com/duncs/clusterssh/issues/10
  LANG=en_US.UTF-8 ./Build test
}

package() {
  cd "${srcdir}"/App-ClusterSSH-$_pkgver

  ./Build install destdir="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
