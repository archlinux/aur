# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=Travel-Routing-DE-VRR
pkgname=perl-travel-routing-de-vrr
pkgver=2.12
pkgrel=2
pkgdesc='Unofficial efa.vrr.de command line client and Perl module'
url='http://finalrewind.org/projects/Travel-Routing-DE-VRR/'
license=('custom:WTFPL')
arch=('any')
depends=('perl-class-accessor' 'perl-exception-class' 'perl-libwww' 'perl-xml-libxml')
makedepends=('perl-module-build' 'perl-file-slurp' 'perl-test-compile' 'perl-test-fatal' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc}
        'http://www.wtfpl.net/txt/copying/COPYING')
md5sums=('2aa1563f1f916cd13aad755c5aff35f3'
         'c9f5f3efd114a0ff925ba9deadcf6817'
         '8365d07beeb5f39d87e846dca3ae7b64')

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
  install -Dm644 ../COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -Dm644 provides/zsh/completions/_efa "${pkgdir}"/usr/share/zsh/site-functions/_efa
}
